Blog::Application.routes.draw do
  root 'posts#index'

  resources :posts
  resources :users, only: [:new, :create, :index]
  resources :comments, only: :create
end
