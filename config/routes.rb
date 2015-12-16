Rails.application.routes.draw do

  root 'pages#home'
  get 'about'     =>  'pages#about'

  resources :articles

  get 'signup'    =>  'users#new'
  resources :users, except: [:new]

  get 'login'     =>  'sessions#new'
  post 'login'    =>  'sessions#create'
  delete 'logout' =>  'sessions#destroy'

  resources :categories, except: [:destroy]
end
