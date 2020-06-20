Rails.application.routes.draw do
  devise_for :customers
  resources :customers,only: [:show,:edit,:update]
  get '/customers/:id/leave' => "customers#leave"
  patch '/customers/:id/hide' => "customers#hide"
  resources :cart_items,only: [:index,:create,:destroy,:update]
  delete '/cart_items' => "cart_items#reset"
  resources :products,only: [:index,:show]
  resources :shippings,only: [:new,:create,:edit,:update,:destroy]
  get '/orders/confirm' => "orders#confirm"
  get '/orders/complete' => "orders#complete"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders,only: [:new,:create,:index,:show]
  root to: 'home#top'
  namespace :admin do
  	get '/' => "home#top"
  	devise_for :administrators
  	resources :products,only: [:index,:new,:create,:show,:edit,:update]
  	resources :genres,only: [:index,:create,:edit,:update]
  	resources :customers,only: [:index,:show,:edit,:update]
  	resources :orders,only: [:index,:show,:update]
  	resources :order_details,only: [:update]
  end

end