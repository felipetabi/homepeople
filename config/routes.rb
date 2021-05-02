Rails.application.routes.draw do
  

  resources :schedules
  get "categories/index"

  resources :services
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
