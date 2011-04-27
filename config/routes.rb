Socialis::Application.routes.draw do
  
  # Nifty-Generators code do

  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  resources :sessions

  resources :users
  
  # Nifty-Generators code end
  
  resources :status
  

  match '/about' => 'home#about'
  match '/profiles/:username' => 'users#show'
  match '/lists/users' => 'home#users'

  
  root :to => 'home#index'

end
