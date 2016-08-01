Rails.application.routes.draw do

  root 'pages#home'

  get '/', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/faq', to: 'pages#faq'

  namespace :app do
    resources :users, as: :user
    resources :token
  end
end
