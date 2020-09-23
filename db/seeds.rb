# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning up database...'
Product.destroy_all

puts 'db clean'
puts 'creating products'

prod_h = [
  {
    name: "Morango", description:"Morangos irresistíveis e sem veneno da fazenda Fresamor",
    price:"8,50" ,quantity:20 ,unit_measurement:"bandeja 250g"
  },
  {
    name: "Kiwi", description:"Limão colhido no sítio do moinho, com alta concentração de vitamina C" ,
    price:"7,80" , quantity:10, unit_measurement:"pacote 500g"
  },
  {
    name: "Banana Prata", description:"Potássio garantido para prevenção de cãibras durante a realização de exercícios físicos" ,
    price:"7,80" , quantity:20 , unit_measurement:"pacote 500g"
  }
]

User.all.each do |usr|
  prod_h.each do |p|
    h_seed = p
    h_seed[:user_id] = usr.id
    Product.create!(h_seed)
  end
end

puts 'seed finished'
