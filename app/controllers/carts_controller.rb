class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @cart_product = Cart_product.new
    @user = current_user
  end
end
