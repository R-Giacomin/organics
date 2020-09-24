class OrdersController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @order = Order.new
    @order.product = @product
    @order.user = @user
    if @order.save
      redirect_to products_path
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to products_path
  end
end
