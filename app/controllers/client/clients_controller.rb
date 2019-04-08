class Client::ClientsController < ApplicationController
  def index; end

  helper_method :current_order

  def current_order
    session[:shopping_cart] ||= []
  end
end
