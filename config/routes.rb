Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'markets#index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :markets do
   resources :receipts, only: [:index, :create]
  end
end
