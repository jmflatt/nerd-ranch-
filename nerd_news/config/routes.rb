Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :posts
  resources :comments do
    post :close_thread
    end     
  resources :up_votes, only: :create
  resources :down_votes, only: :create

end
