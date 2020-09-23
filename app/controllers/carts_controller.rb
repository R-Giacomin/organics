class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @user = current_user
  end
end
