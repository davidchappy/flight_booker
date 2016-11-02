Rails.application.routes.draw do
  root 'flights#index'
  get 'flights', to: 'flights#index'
  get 'flights/show'

  resources :bookings, only: [:new, :create, :show]
end
