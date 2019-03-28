Rails.application.routes.draw do

  root "static_pages#home"

  get "/contact", to: "static_pages#contact"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users

  namespace :admin do
    root "admins#index"
    resources :categories
  end

  get "/admin", to: "admin/admins#index"

  namespace :client do
    root "clients#index"
  end

  get "/welcome", to: "client/clients#index"

end
