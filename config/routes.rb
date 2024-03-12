Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
    get 'userslists', to: 'userslists#index'
  end

  devise_for :users
  root "bookings#index"
  resources :bookings
end
