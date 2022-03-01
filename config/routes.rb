Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects do
    resources :booking
  end
  # resources :dashboard, only: [:index], as: 'dashboard'
  get '/dashboard', to: 'dashboards#index', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
