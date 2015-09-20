Rails.application.routes.draw do

  root 'welcome#index'
  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'

  resources :users, except: :new
  resources :alerts
  resources :sessions, except: :new

end
