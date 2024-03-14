Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'markets#index'
  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< Updated upstream
  resources :markets, only: [:index, :new, :create, :show] #do
=======
  resources :markets #do
>>>>>>> Stashed changes
    #resources :recepits, only: [:index, :create]
  #end
end
