Rails.application.routes.draw do
root to: 'pets#index'
resources :pets

  #sessions routes
  get '/mobile' => 'application#mobile'
  get '/sessions/new' => 'sessions#new', as: :new_sessions
  post '/sessions' => 'sessions#create', as: :session
  delete '/sessions' => 'sessions#destroy'

end
