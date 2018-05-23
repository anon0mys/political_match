Rails.application.routes.draw do
  root to: 'home#index'

  get '/sign-up', to: 'users#new', as: :sign_up
  get '/login', to: 'sessions#new', as: :login
end
