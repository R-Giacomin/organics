class Product < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def self.search(search)
    if search
      @products = Product.find_by(name: search)
    else
      @products = Product.all
    end
  end
end
