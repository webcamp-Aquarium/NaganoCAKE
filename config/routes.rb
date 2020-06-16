Rails.application.routes.draw do
  devise_for :customers
  resources :customers,only: [:show,:edit,:update]
  devise_for :administrators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
end