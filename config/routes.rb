Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
    resources :userslists, only: [:index, :show]
    resources :activity_tracking, only:[:new, :create, :show, :index]
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "bookings#index"
  resources :bookings
end
