Rails.application.routes.draw do
  devise_for :users

  root 'users#index'


  get '/api/users/:user_id/posts', to: 'api/posts#index'
  get '/api/comments/:post_id', to: 'api/comments#index'
  post '/api/users/:user_id/posts/:post_id/comments', to: 'api/comments#create'

  get '/users', to: 'users#index', as: 'users'
  get '/users/:user_id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:post_id', to: 'posts#show', as: 'user_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_posts'
  post '/users/:user_id/comment/:post_id', to: 'comment#create', as: 'create_comment'
  post '/users/:user_id/like/:post_id', to: 'like#create', as: 'create_like'
  delete  '/users/:user_id/posts/:post_id', to: 'posts#destroy', as: 'destroy_user_post'
  delete  '/users/comment/:comment_id', to: 'comment#destroy', as: 'destroy_user_comment'
end
