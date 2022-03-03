Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects do
    resources :favorites, only: [:create]
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:update, :destroy]
  resources :favorites, only: [:destroy]
  get '/dashboard', to: 'dashboards#index', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update', as: :user

  get '/skills', to: 'skills#edit', as: :edit_skills
  patch '/skills', to: 'skills#update'

  post '/project/:project_id/projectfavorites', to: 'favorites#createfavorite', as: :project_favorite
  delete '/projectfavorite/:id', to: 'favorites#destroyfavorite', as: :project_favorite_delete

end
