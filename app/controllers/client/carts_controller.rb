class Client::CartsController < ApplicationController
  before_action :current_order, only: %i(index create destroy)
  before_action :load_product, only: %i(create destroy)
  before_action :reload_cart, only: :index

  include MyModules::Carts

  def index; end

  def create
    binding.pry
    if check_quantity_validation @product
      flash[:danger] = t "flash.out_of_index"
    elsif update_existed_item @product
      flash[:success] = t "added"
    else
      add_new_item @product
    end
    redirect_to products_path
  end

  def destroy
    update_after_deleting @product
    flash[:success] = t "success_delete"
    redirect_to client_carts_path
  end

  private

  def item_params
    params.require(:order_product).permit :product_id, :price, :quantity
  end

  def load_product
    id = params["id"] || item_params[:product_id]
    @product = Product.find_by id: id
    return if @product
    flash[:danger] = t "not_found_product"
    redirect_to products_path
  end

  def reload_cart
    @items = {}
    session[:cart].each do |key, value|
      item = {}
      load_product_from_cart key
      next unless @product
      item[:product] = @product
      item[:quantity] = value
      @items[key] = item
    end
    load_total_cost @items
  end

  def load_total_cost items
    @total = items.values.reduce(0) do |a, e|
      a + e[:product][:price] * e[:quantity]
    end
  end

  def load_product_from_cart key
    @product = Product.find_by id: key
    return if @product
    session[:cart].except!(key)
  end

  def check_quantity_validation product
    item_params[:quantity].to_i <= Settings.lowest_quantity ||
      product.quantity < item_params[:quantity].to_i
  end

  def update_existed_item product
    session[:cart].each do |key, value|
      next unless key.to_i == product.id
      session[:cart][key] = load_added_qty value, item_params[:quantity]
      remain_qty = load_remain_qty product.quantity, item_params[:quantity]
      return true if product.update_attribute :quantity, remain_qty
      flash[:danger] = t "flash.update_fail"
    end
    false
  end

  def add_new_item product
    session[:cart][product.id] = item_params[:quantity].to_i
    remain_qty = load_remain_qty product.quantity, item_params[:quantity]
    product.update_attribute :quantity, remain_qty
    flash[:success] = t "success_add"
  end

  def update_after_deleting product
    session[:cart].each do |key, value|
      next unless key == params[:id]
      added_quantity = load_added_qty product.quantity, value
      if product.update_attribute :quantity, added_quantity
        session[:cart].except!(key)
      else
        flash[:danger] = t "flash.delete_fail"
        redirect_to carts_path
      end
    end
  end
end
