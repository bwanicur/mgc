Rails.application.routes.draw do
  root to: 'backstage/home_controller#home', method: :get, constraints: RouteConstraints::UserHasAuth.new, as: :auth_root
	root to: 'sessions#new', method: :get
  
	resources :sessions, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create, :show ]
  resources :gigs, only: [ :index, :show ]
  resources :gig_invitations, only: [ :show, :update ]
  
  namespace :backstage do
    resources :users, only: [ :update, :show ]
    resources :gigs, only: [ :index, :show, :create, :update, :destroy ]
    resources :musicians, only: [ :index, :show, :create, :update, :destroy ]
    resources :gig_musician_memberships, only: [ :create, :update, :destroy ]
    resources :venues, only: [ :index, :show, :create, :update, :destroy ]
  end

end
