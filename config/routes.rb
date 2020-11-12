Rails.application.routes.draw do 
  get 'home/index'
  resources :roles
  resources :permissions
  resources :posts
  devise_for :users


 root to: "home#index"
end
