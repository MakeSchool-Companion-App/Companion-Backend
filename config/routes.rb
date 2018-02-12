Rails.application.routes.draw do
  resources :attendances
  resources :active_sessions
  resources :registrations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
