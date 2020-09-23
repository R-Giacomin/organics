Rails.application.routes.draw do
  devise_for :users
  resources :products

  resources :products do
    resources :cart_products, only: [:create]
  end

  resources :cart_products, only: [:destroy]
  resources :carts, only: [:show]

  root to: 'products#index'
end
