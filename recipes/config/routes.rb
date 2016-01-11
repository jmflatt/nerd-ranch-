Rails.application.routes.draw do
  namespace :admin do
    get 'recipes/index'
  end

  resources :recipes, except: [:destroy] do
    patch :like, on: :member
    resources :ingredients, except: [:index, :show]
  end

  constraints AdminWhitelistConstraint.new do
    namespace :admin do
      resources :recipes, only: [:index, :destroy]
    end
  end

  get '/shortcode', to: 'parmalinks#show', as: :permalink, constraints: {
    shortcode: /\h{6}/}

end
