Rails.application.routes.draw do
  get 'rooms/create'
  get 'rooms/show'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'likes/create'
  get 'likes/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/current'
  devise_for :users
  get 'posts/hokkaidou' => 'posts#hokkaidou'
  get 'posts/touhoku' => 'posts#touhoku'
  get 'posts/kanntou' => 'posts#kanntou'
  get 'posts/chuubu' => 'posts#chuubu'
  get 'posts/kannsai' => 'posts#kannsai'
  get 'posts/shikochuu' => 'posts#shikochuu'
  get 'posts/kyuushuu' => 'posts#kyuushuu'
  get 'posts/okinawa' => 'posts#okinawa'
  
  root 'posts#home'
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  get 'users/current'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
