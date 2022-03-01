Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects do
    resources :favorites, only: [:create]
    resources :bookings, only: [:new, :create, :update]
  end
  resources :favorites, only: [:destroy]
  resources :bookings, only: [:destroy]
  resources :skills, only: [:edit, :create]
  # resources :dashboard, only: [:index], as: 'dashboard'
  get '/dashboard', to: 'dashboards#index', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
