ServiceOrders::Application.routes.draw do

  get "event/index"
  devise_for :users, :controllers => {
    :sessions => "sessions",
    :registrations => "users",
    :invitations => 'invitations'
  }

  resources :tickets
  resources :roles
  resources :users
  resources :service_orders
  resources :clients
  resources :print_view, only: [:show]
  resources :events
  resource :reports, only: [:show]

  root :to => 'events#index'

end
