Rails.application.routes.draw do
  devise_for :users
  resources :products

  resources :products do
    resources :cart_products, only: [:create]
    resources :orders, only: [:new, :create]
  end

  resources :cart_products, only: [:destroy]
  resources :carts, only: [:show]
  resources :orders, only: [:show, :destroy]

  root to: 'products#index'
end
