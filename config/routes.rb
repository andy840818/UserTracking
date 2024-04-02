Rails.application.routes.draw do
  root "pages#home"
  devise_for :admins, controllers: { 
    sessions: 'admins/sessions'
  }
  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
    get 'daily_statistic', to: 'admins/daily_statistic'
    get 'weekly_statistic', to: 'admins/weekly_statistic'
    resources :userslists, only: [:index, :show]
    resources :activity_tracking, only:[:show, :index]
  end

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
 
  resources :bookings, except:[:derstroy] do
    member do
      patch :cancel
      patch :restore
    end
  end
  get '/home', to: 'pages#home'
end
