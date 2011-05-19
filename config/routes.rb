Socialis::Application.routes.draw do
  
  resources :friendships

  # Nifty-Generators code do

  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  resources :sessions

  resources :users
  
  # Nifty-Generators code end
  
  resources :status
  
  match '/statuses' => 'status#index'
  match '/about' => 'home#about'
  match '/help' => 'home#help'
  
  # Users Have profile pages
  match '/profile' => 'profile#index'
  match '/profiles/:id' => 'profile#show'
  match '/profiles/:id/friends' => 'profile#friends'
  match '/profiles/:id/statuses' => 'profile#statuses'
  
  # User Index
  match '/profiles' => 'users#index'
  match '/users' => 'users#index'
  
  # Future version compare
  match '/version' => 'application#version'
  
  root :to => 'home#index'

end
