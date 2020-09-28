class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
      @products = Product.where('name ILIKE ?', "%#{params[:search]}%")
    else
      @products = Product.all
    end
    @user = current_user
    return unless @user.geocoded?

    @distances = {}
    @products.each do |product|
      next unless product.user.geocoded?

      producer = product.user
      @distances[producer.id] = num_formated(producer.distance_to(@user.address), 1)
    end
  end

  def my_products
    @user = current_user
    @id = current_user.id
    @products = Product.where(user_id: @id)
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
  end

  def show
    @user = current_user
    @product = Product.find(params[:id])
    @markers = [@user, @product.user].map do |user|
      next unless user&.geocoded?

      { lat: user.latitude, lng: user.longitude,
        infoWindow: render_to_string(partial: "products/info_window", locals: { user: user, cola: "gás" }) }
    end
    @order = Order.new
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_restaurant
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :price.to_s, :quantity, :search, :photo, :unit_measurement)
  end

  def num_formated(num, precision)
    num_rounded = num.round(precision)
    int_txt = num_rounded.to_i.to_s.reverse.gsub(/...(?=.)/, '\&.').reverse
    frac_txt = precision.positive? ? ",#{num_rounded.to_s[-1 - (precision - 1)]}" : ""
    "#{int_txt}#{frac_txt}"
  end
end
