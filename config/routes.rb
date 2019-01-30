Rails.application.routes.draw do
  resources :beacons
  resources :attendances
  resources :active_sessions
  resources :registrations
  resources :users
  get 'portfolio', to: "users#portfolio"
  resources :users do 
    get "facebook_users"
  resources :search_users
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
