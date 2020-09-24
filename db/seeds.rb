# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require_relative 'seed_aux'

puts 'cleaning up database...'

CartProduct.destroy_all
Product.destroy_all
Cart.destroy_all
User.destroy_all

puts 'Seeding users...'
feed_user(20)

puts 'Seeding products...'
User.all.each do |usr|
  if usr.category === 'Produtor(a)'
    feed_product(usr, (1..3).to_a.sample)
  end
end

puts 'Seeding carts...'
User.all.each do |usr|
  if usr.category === 'Comprador(a)'
    feed_cart(usr)
  end
end


puts 'Seeding cart_products...'
Cart.all.each do |cart|
  Product.all.each do |product|
    feed_cart_product(cart, product)
  end
end

Order.create(user: User.first, product: Product.first)

puts 'seed finished'


