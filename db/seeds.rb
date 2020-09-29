require 'json'
require_relative 'seed_aux'

puts 'cleaning up database...'

CartProduct.destroy_all
Cart.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

puts 'Seeding users...'
feed_user(6)

puts 'Seeding products...'
User.all.each do |usr|
  if usr.category.downcase === 'produtor(a)'
    feed_product(usr, (1..3).to_a.sample)
  end
end

# puts 'Seeding carts...'
# User.all.each do |usr|
#   feed_cart(usr) if usr.category === 'Comprador(a)'
# end

puts 'Seeding orders...'
User.all.each do |usr|
  feed_cart(usr)
end

# puts 'Seeding cart_products...'
# Cart.all.each do |cart|
#   Product.all.each do |product|
#     feed_cart_product(cart, product)
#   end
# end


Order.create(user: User.first, product: Product.first)

puts 'seed finished'
