class Client::OrdersController < Client::ClientsController
  before_action :current_order, only: :create

  def index
    @orders = current_user.orders.order_by_created_time.page(params[:page]).per(
      Settings.paging_sm
    )
  end

  def create
    ActiveRecord::Base.transaction do
      create_order
      session[:cart].each do |key, value|
        load_product key
        create_order_product @product, value, @order.id
      end
      session[:cart].clear
      send_order @order
      flash[:success] = t "flash.ordered"
      redirect_to client_orders_path
    end
  rescue ActiveRecord::RecordInvalid
    flash[:warning] = t "flash.rescue_order_creating"
  end

  private

  def create_order
    @order = Order.create(user_id: current_user.id)
    return if @order.save
    flash[:danger] = t "flash.order_faild"
    redirect_to client_carts_path
  end

  def load_product key
    @product = Product.find_by id: key
    return if @product
    flash[:danger] = t "flash.no_longer_sold", name: @product.name
    redirect_to client_carts_path
  end

  def create_order_product product, quantity, order_id
    order_product = OrderProduct.new(
      product_id: product.id,
      quantity: quantity,
      price: product.price,
      order_id: order_id
    )
    return if order_product.save
    flash[:warning] = t "flash.cannot_save"
    redirect_to client_orders_path
  end

  def send_order order
    OrderMailer.new_order(current_admin, current_user, order).deliver_later
  end
end
