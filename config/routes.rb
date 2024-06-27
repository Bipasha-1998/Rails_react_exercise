Rails.application.routes.draw do
  namespace :api do
    namespace :vi do
      get 'recipes/index'
      post 'recipe/create', to: 'recipes#create'
      get '/show/:id', to: 'recipes#show'
      delete '/destroy/:id', to:'recipes#destroy'
    end
  end
  root to: "homepage#index"
  get "/*path" => "homepage#index"
end
