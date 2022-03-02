Rails.application.routes.draw do
  resources :pages, except: [:show]
  get '/pages/:permalink' => "pages#permalink", as: 'permalink'
  # get 'countries/index'
  # get 'countries/show'
  # get 'players/index'
  # get 'players/show'
  resources :countries, only: [:index, :show]
  resources :players, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "players#index"

end
