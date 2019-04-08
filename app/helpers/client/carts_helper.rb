module Client::CartsHelper
  def current_order
    session[:cart] ||= {}
  end
end
