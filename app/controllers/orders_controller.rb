class OrdersController < ApplicationController
  def index
    @user = current_user
    @orders = @user.orders
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @order = Order.new(strong_params)
    @order.product = @product
    @order.user = @user
    if @order.save
      redirect_to orders_path
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def strong_params
    params.require(:order).permit(:quantity)

  end
end
