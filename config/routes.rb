Rails.application.routes.draw do
  devise_for :admins, controllers: { 
    sessions: 'admins/sessions'
  }
  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
    resources :userslists, only: [:index, :show]
    resources :activity_tracking, only:[:show, :index]
  end

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "bookings#index"
  resources :bookings
end
