Rails.application.routes.draw do
  devise_for :users
  resources :products

  resources :products do
    resources :cart_products, only: [:create]
    resources :orders
  end

  resources :cart_products, only: [:destroy]
  resources :carts, only: [:show]
  resources :orders, only: [:destroy]

  root to: 'products#index'
end
