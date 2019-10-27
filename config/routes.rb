Rails.application.routes.draw do
  root 'posts#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # update,deleteは現時点では許容しない
  resources :users, only: %i[show create new]
  resources :posts, shallow: true do
    resources :comments
  end
end
