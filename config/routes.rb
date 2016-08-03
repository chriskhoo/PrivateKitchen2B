Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',                   to:   'static_pages#help'
  get  '/about',                  to:   'static_pages#about'
  get  '/signup',                 to:   'users#new'
  post '/signup',                 to:   'users#create'
  get    '/login',                to:   'sessions#new'
  post   '/login',                to:   'sessions#create'
  delete '/logout',               to:   'sessions#destroy'
  post    '/invitation_request',  to:   'signups#create'
  delete  '/invitation_repeal',   to:   'signups#destroy'
  patch   '/invitation_accept',   to:   'signups#update'

  resources :users
  resources :events
end
