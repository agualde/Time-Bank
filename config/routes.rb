Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects do
    resources :favorites, only: [:create]
    resources :bookings, only: [:new, :create, :update, :show]
  end
  resources :favorites, only: [:destroy]
  resources :skills, only: [:edit, :create]
  get '/dashboard', to: 'dashboards#index', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/project/:project_id/projectfavorites', to: 'favorites#createfavorite', as: :project_favorite
  delete '/projectfavorite/:id', to: 'favorites#destroyfavorite', as: :project_favorite_delete
  delete '/bookings/:id', to: 'bookings#destroy', as: :booking

end
