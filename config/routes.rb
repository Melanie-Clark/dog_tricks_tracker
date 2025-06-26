Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
  get "dashboard", to: "pages#dashboard"

  get "register", to: "users#new"
  resources :users

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  post "save_tricks", to: "pages#save_tricks", as: :save_tricks
end
