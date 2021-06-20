Rails.application.routes.draw do
  get 'payment/exito'
  root to: "home#index"
  devise_for :users
  resources :services
  resources :categories
  resources :bookings, only: [:index] do 
    resources :chats, only: [:show] do
      resources :messages, only: [:create]
      post "confirm-service" 
      post "confirm-client"
    end
    resources :comments, only: [:new, :create]
    collection do
     get :my_services_booking, as: :my_services
     post :create_reserve, as: :create_reserve
    end
  end
  resources :working_settings, only: [:create, :update]
  resources :schedules do
    collection do
      post "create-calendar", as: :create_calendar
    end
  end
  get "search", to: "search#index"
  get "get-cities", to: "search#get_cities"
  get "get-cities", to: "service#get_cities"

end
