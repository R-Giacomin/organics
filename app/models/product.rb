class Product < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :orders
  has_one_attached :photo
end
