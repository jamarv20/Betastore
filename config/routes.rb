Betastore::Application.routes.draw do
  
  root :to => 'products#index'
  resources :subscriptions
  
  get '/products' => 'products#index', as: 'products'
  get '/products/:id' => 'products#show', as: 'product'

  post '/products/:product_id/add_to-cart' => 'carts#update', as: 'add_to_cart'
  get '/cart' => 'carts#show', as: 'cart'
  
  get 'checkout' => 'orders#new', as: 'checkout'
  post '/checkout'  => 'orders#create'
  
  put '/order' => 'orders#update', as: 'order'
  
  namespace :admin do
    resources :products

    get 'login', to: 'logins#new', as: 'login'
    post 'login', to: 'logins#create' 
     end
  
end