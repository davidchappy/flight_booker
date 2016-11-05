Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'flights#index'
  get 'flights', to: 'flights#index'
  get 'flights/show'

  resources :bookings, only: [:new, :create, :show]
end
