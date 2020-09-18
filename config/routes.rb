Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/current'
  devise_for :users
  resources :posts
  root 'posts#home'

  resources :users
  get 'users/current'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
