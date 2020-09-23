Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :products do
    resources :cart_products, only: [:create]
  end

  resources :cart_products, only: [:destroy]
end
