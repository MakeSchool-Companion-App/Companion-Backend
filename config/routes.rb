Rails.application.routes.draw do
  resources :attendances
  resources :active_sessions
  resources :registrations
  resources :users
  resources :users do 
    get "facebook_users"
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
