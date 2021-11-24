Rails.application.routes.draw do
  root to: "sessions#new", method: :get

  get "/logout", to: "sessions#destroy", as: :logout
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create, :show ]
  resources :gigs, only: [ :index, :show ]
  resources :gig_invitations, only: [ :edit, :update ]

  namespace :backstage, constraints: RouteConstraints::UserHasAuth.new do
    # ReactJS App - GigManager
    get "/", to: "home#home", as: :root

    # API Endpoints
    namespace :api do
      resources :users, only: [ :show, :update ]
      resources :gigs, only: [ :index, :show, :create, :update, :destroy ]
      resources :musicians, only: [ :index, :show, :create, :update, :destroy ]
      resources :venues, only: [ :index, :show, :create, :update, :destroy ]
    end
  end
end
