Rails.application.routes.draw do

  resources :customers,only: [:show,:edit,:update]
  get 'customers/:id/leave' => 'customers#leave'
  get 'customers/:id/hide' => 'customers#hide'
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
