Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }

  as :user do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "devise/sessions#destroy"

    get "/signup", to: "registrations#new"
  end

  root "categories#index"

  get "/contact", to: "static_pages#contact"

  get "/admin", to: "admin/admins#index"
  get "/welcome", to: "client/clients#index"

  resources :users
  resources :products
  resources :categories

  namespace :admin do
    root "admins#index"
    resources :users
    resources :categories
    resources :products
  end

  namespace :client do
    root "clients#index"
    resources :carts
    resources :orders, only: [:create, :index]
    resources :rates, only: :create
  end

end
