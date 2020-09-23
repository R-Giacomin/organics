class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:search].present?
      @products = Product.where('name ILIKE ?', "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @product.user != current_user
      redirect_to root_path, alert: 'Not authorized'
      # return
    else
      @product.destroy
      redirect_to products_path, notice: 'Product was successfully destroyed.'
    end

  def show
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_restaurant
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :search)
  end
end
