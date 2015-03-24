Rails.application.routes.draw do

  root to: 'posts#index' 

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'

  get 'signup', to: 'users#new', as: 'signup'
  resources :users
  resources :posts

end
