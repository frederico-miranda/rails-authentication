Rails.application.routes.draw do
  get '/posts', to: 'posts#index', as: 'posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts/new', to: 'posts#create'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users/new', to: 'users#create'
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#delete', as: 'sign_out'
  delete '/sign_out', to: 'sessions#delete'
  root 'static_pages#home'
end
