Rails.application.routes.draw do

  resources :customers,only: [:show,:edit,:update]
  get 'customers/:id/leave' => 'customers#leave'
  # PATCH 'customers/:id/hide' => 'customers#hide'
  devise_for :customers

  resources :cart_items, only: [:index,:create,:destroy,:update]
  # PATCH 'cart_items' => 'cart_items#reset'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
