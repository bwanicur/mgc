Rails.application.routes.draw do
  root to: 'sessions#new', method: :get

  get '/logout', to: 'sessions#destroy', as: :logout
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create, :show ]
  resources :gigs, only: [ :index, :show ]
  resources :gig_invitations, only: [ :show, :update ]

  namespace :backstage, constraints: RouteConstraints::UserHasAuth.new do
    # ReactJS App - GigManager
    get '/', to: 'home#home', as: :root

    # API Endpoints
    namespace :api do
      resources :users, only: [ :show, :update ]
      resources :gigs, only: [ :index, :show, :create, :update, :destroy ]
      resources :musicians, only: [ :index, :show, :create, :update, :destroy ]
      resources :gig_musician_memberships, only: [ :create, :update, :destroy ]
      resources :venues, only: [ :index, :show, :create, :update, :destroy ]
      post 'gig_invitations/send_sms_invitation/', to: 'gig_invitations#send_sms_invitation'
      post 'gig_invitations/send_email_invitation/', to: 'gig_invitations#send_email_invitation'
    end
  end
end
