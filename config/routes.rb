Birdie::Application.routes.draw do
  
  resources :users
  
  controller :products do
    post 'tweet' => :index 
  end
  
  get "sessions/create"
  get "sessions/destroy"

  match '/auth/twitter/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout
  
  root to: 'products#index'
  resources :products
  
end