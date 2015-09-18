Rails.application.routes.draw do

  root 'welcome#index'
  get 'login' => 'sessions#new'
  get 'signup' => 'user#new'

  resources :users
  resources :alerts
  resources :sessions

end
