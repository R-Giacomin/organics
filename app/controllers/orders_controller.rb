class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @order = Order.new
    @order.product = @product
    @order.user = @user
    @quantity = params[:quantity]
    @order.quantity = @quantity
    if @order.save
      redirect_to orders_path
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
end
