Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#delete', as: 'sign_out'
  delete '/sign_out', to: 'sessions#delete'
  resources :posts, only: [:new, :create, :index]
  resources :users, only: [:new, :create, :destroy]
  root 'static_pages#home'
end
