Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
    resources :userslists, only: [:index, :show]
  end

  devise_for :users
  root "bookings#index"
  resources :bookings
end
