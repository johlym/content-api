Rails.application.routes.draw do

  root 'static#home'

  get '/profile', to: 'profile#show'

  post '/regenerate', to: 'profile#regenerate', as: :regenerate_key

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :nodes, :defaults => { :format => :json }, except: :new

end
