Rails.application.routes.draw do

  root 'welcome#index'
  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'
  get 'profile' => 'users#show'

  resources :users
  resources :alerts
  resources :sessions

end
