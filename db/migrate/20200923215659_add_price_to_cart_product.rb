class AddPriceToCartProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_products, :price, :integer
  end
end
