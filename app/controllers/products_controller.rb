class ProductsController < ApplicationController
  def index
    if params[:search].present?
      @products = Product.where('name ILIKE ?', "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :search)
  end
end
