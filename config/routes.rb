Rails.application.routes.draw do
  get 'emojis/index'
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/index_create" => "likes#index_create"
  post "likes/:post_id/index_destroy" => "likes#index_destroy"
  post "likes/:post_id/users_create" => "likes#users_create"
  post "likes/:post_id/users_destroy" => "likes#users_destroy"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/likes" => "users#likes"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id/quote" => "posts#quote"
  get "posts/:id/index_quote" => "posts#index_quote"
  post "posts/quote" => "posts#quote_post"
  post "posts/index_quote" => "posts#index_quote_post"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "emoji" => "emojis#index"
  get "emoji/new" => "emojis#new"
  post "emoji/create" => "emojis#create"
  
  get "/" => "home#top"
  get "about" => "home#about"
end
