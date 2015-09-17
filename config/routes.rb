Rails.application.routes.draw do

  root 'welcome#index'
  get 'login' => 'session#new'
  post 'session' => 'session#create'
  delete 'session/:id' => 'session#destroy'
  get 'signup' => 'user#new'
  resources :users
  resources :alerts

end
