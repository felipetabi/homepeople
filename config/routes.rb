Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :services
  resources :categories
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
