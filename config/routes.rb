Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
  get '/users', to: 'users#index', as: 'users'
  get '/users/:user_id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_posts'
  post '/users/:user_id/comment/:post_id', to: 'comment#create', as: 'create_comment'
  post '/users/:user_id/like/:post_id', to: 'like#create', as: 'create_like'
end
