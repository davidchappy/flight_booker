Rails.application.routes.draw do
  root 'flights#index'
  get 'flights', to: 'flights#index'
  get 'flights/show'
end
