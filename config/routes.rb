Rails.application.routes.draw do
  devise_for :users

  get 'my_products', to: 'products#my_products'

  resources :products

  resources :products do
    resources :cart_products, only: [:create]
    resources :orders, only: [:new, :create]
  end

  resources :cart_products, only: [:destroy]
  resources :carts, only: [:show]
  resources :orders, only: [:index, :show, :destroy]

  root to: 'products#index'
end
