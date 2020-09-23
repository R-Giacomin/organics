class CartProductsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.product = @cart_product
    @cart_product.save
    # if @cart_product.save 
    #     redirect_to products_path(@product) 
    # else 
    #     render 'products/show' 
    # end 
  end

  def destroy
    @cart_product = CartProduct.find(params[:id]) 
    @cart_product.destroy 
    redirect_to cart_path(@cart_product.product)
  end

  #Não criamos a rota show do carrinho. Imaginamos que o path seria /carts/:id

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :cart_id, :products_id)
  end
  
end
