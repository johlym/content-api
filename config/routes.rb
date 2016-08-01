Rails.application.routes.draw do

  root 'static#home'

  get '/profile', to: 'profile#show'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :token
end
