Rails.application.routes.draw do
  root to: 'home#index'

  get '/sign-up', to: 'users#new', as: :sign_up
  get '/login', to: 'sessions#new', as: :login
  get '/dashboard', to: 'dashboard#show', as: :dashboard

  resources :users, only: %i[create]
  resources :profiles, only: %i[new]
end
