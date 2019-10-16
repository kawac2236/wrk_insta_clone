Rails.application.routes.draw do
  root 'users#new'
  get 'users/new'
  resources :users
end
