Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get "play", to: 'pages#play'
  get "countries/:id", to: 'countries#show', as: :country
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :wishes
  resources :visits
end
