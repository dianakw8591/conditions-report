Rails.application.routes.draw do
  resources :locations
  resources :data
  resources :posts
  resources :stations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
