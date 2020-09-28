require 'uri'

def feed_user(qde_users)
  file = './db/pessoa.json'
  pessoas = JSON.parse(File.open(file).read).sample(qde_users)
  # category = ['Comprador(a)', 'Produtor(a)', 'Comprador(a)', 'Comprador(a)']

  pessoas.each do |pessoa|
    pessoa.transform_keys!(&:to_sym)
    usr_h = {
      email: pessoa[:email], name: pessoa[:nome], category: pessoa[:category],
      address: pessoa[:endereco], password: '123456' }
    User.create!(usr_h)
  end
end

def feed_product(usr, qdePrd)
  file = './db/product.json'
  products = JSON.parse(File.open(file).read)
  if usr.category === 'Produtor(a)'
    products.sample(qdePrd).each do |p|
      h_seed = p
      url = p["url"]
      h_seed.delete("url")
      h_seed[:user_id] = usr.id
      Product.create!(h_seed)
      filename = File.basename(URI.parse(url).path)
      file = URI.open(url)
      prod = Product.last
      prod.photo.attach(io:file, filename: filename)
    end
  end
end

def feed_cart(usr)
  cart_h = [
    { status: 'aberto' }, { status: 'fechado' },
    { status: 'aberto' }, { status: 'fechado' },
    { status: 'aberto' }, { status: 'cancelado' }
  ]
  if usr.category === 'Comprador(a)'
    2.times do
      h_seed = { status: cart_h.sample }
      h_seed[:user_id] = usr.id
      Cart.create!(h_seed)
    end
  end
end

def feed_order(usr)
  2.times do
    h_seed[:user_id] = usr.id
    Cart.create!(h_seed)
  end
end

def feed_cart_product(cart, product)
  h_seed = {
    quantity: (1..20).to_a.sample,
    price: Random.new.rand(0.9..1.4),
    cart_id: cart.id, product_id: product.id
  }
  CartProduct.create!(h_seed)
end
