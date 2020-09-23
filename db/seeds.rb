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

Product.create(name: "Morango", description:"Morangos irresistíveis e sem veneno da fazenda Fresamor",
price:"8,50" ,quantity:20 ,unit_measurement:"bandeja 250g", user_id: 5) 
Product.create(name: "Kiwi", description:"Limão colhido no sítio do moinho, com alta concentração de vitamina C" , 
price:"7,80" , quantity:10, unit_measurement:"pacote 500g", user_id: 5)
Product.create(name: "Limão Tahiti", description:"Perfeito para o bom funcionamento do sistema imunológico" ,
price:"7,80" , quantity:6 , unit_measurement: "pacote 500g", user_id: 5)
Product.create(name: "Banana Prata", description:"Potássio garantido para prevenção de cãibras durante a realização de exercícios físicos" , 
price:"7,80" , quantity:20 , unit_measurement:"pacote 500g", user_id: 5)

# Product.create(name: "maçã", description: , price: , quantity: , unit_measurement: , user_id: )
# Product.create(name: "abacaxi", description: , price: , quantity: , unit_measurement: , user_id: )
# Product.create(name: "abacate", description: , price: , quantity: , unit_measurement: , user_id: )
# Product.create(name: "cenoura", description: , price:"8,00" , quantity: , unit_measurement:"kg" , user_id: )
# Product.create(name: "batata-doce", description: , price:"8,00" , quantity: , unit_measurement:"kg" , user_id: )
# Product.create(name: "manga-rosa", description: , price:"8,00" , quantity: , unit_measurement:"kg" , user_id: )
# Product.create(name: "beterraba", description: , price:"8,00" , quantity: , unit_measurement:"kg" , user_id: )
# Product.create(name: "alho-poró", description: , price:"7,80", quantity: , unit_measurement:"maço" , user_id: )
# Product.create(name: "tomate", description: , price: , quantity: , unit_measurement: , user_id: )
# Product.create(name: "abóbora japonesa", description: , price:"6,00" , quantity: , unit_measurement:"kg" , user_id: )
# Product.create(name: "cebola", description: , price: , quantity: , unit_measurement: , user_id: )
# Product.create(name: "alface", description: , price:"4,50" , quantity: , unit_measurement:"maço" , user_id: )

puts 'seed finished'

