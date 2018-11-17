Rails.application.routes.draw do

  resources :users
  get 'users/show'
  post 'users/follow'
  post 'users/unfollow'

  resources :posts
  get 'debug/index'

  devise_for :users, :path => 'u'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
