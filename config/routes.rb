Rails.application.routes.draw do
  root to: 'home#index'

  get '/sign-up', to: 'users#new', as: :sign_up
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/dashboard', to: 'dashboard#show', as: :dashboard

  resources :politicians, only: %i[index show]
  resources :matches, only: %i[index]

  resources :users, only: %i[create] do
    resources :profiles, only: %i[new create]
  end

  namespace :api do
    namespace :v1 do
      resources :matches, only: %i[index]
    end
  end
end
