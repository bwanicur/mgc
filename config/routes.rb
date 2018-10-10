Rails.application.routes.draw do
  root to: 'sessions#new', method: :get

  # ReactJS App - GigManager
  root to: 'backstage/home#home', method: :get, constraints: RouteConstraints::UserHasAuth.new, as: :auth_root

  root to: 'sessions#new', method: :get

  get '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create, :show ]
  resources :gigs, only: [ :index, :show ] do
    member do
      get :info
    end
  end
  resources :gig_invitations, only: [ :show, :update ]

  namespace :backstage do
    namespace :api do
      resources :users, only: [ :update, :show ]
      resources :gigs, only: [ :index, :show, :create, :update, :destroy ]
      resources :musicians, only: [ :index, :show, :create, :update, :destroy ]
      resources :gig_musician_memberships, only: [ :create, :update, :destroy ]
      resources :venues, only: [ :index, :show, :create, :update, :destroy ]
      post 'gig_invitations/send_sms_invitation/', to: 'gig_invitations#send_sms_invitation'
      post 'gig_invitations/send_email_invitation/', to: 'gig_invitations#send_email_invitation'
    end
  end

end
