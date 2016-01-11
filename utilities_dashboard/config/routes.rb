require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  resources :utilities do
    resources :privileges, only: [:index,  :new, :create, :destroy]
  end

  resources :bills
  resources :export_requests
  mount Sidekiq::Web, at: '/sidekiq'
  root to: 'homes#show'
end
