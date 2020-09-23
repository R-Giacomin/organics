# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "banana maça", description:"Kg", price: 6, quantity: 3 )
product.user = User.find(1)
product.save
product = Product.new(name: "banana caturra", description:"Kg", price: 5, quantity: 5 )
product.user = User.find(1)
product.save
product = Product.new(name: "maça gala", description:"Kg", price: 5, quantity: 5 )
product.user = User.find(1)
product.save
product = Product.new(name: "maça julieta", description:"Kg", price: 5, quantity: 5 )
product.user = User.find(1)
product.save
