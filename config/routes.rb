Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  root to: "toppages#index"
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
  
  get "rankings/want", to: "rankings#want"
  get "rankings/have", to: "rankings#have"
  
end
