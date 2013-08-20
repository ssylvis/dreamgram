Dreamgram::Application.routes.draw do
  # Welcome page
  get "home/index"

  # Login/out pages
  get 'login', :to => 'sessions#new'
  delete 'logout', :to => 'sessions#destroy'
  get 'signup', :to => 'users#new'

  # REST resources
  resources :dreams, :except => [:show]
  resources :sessions, :only => [:create, :destroy, :new]
  resources :users, :only => [:create, :destroy, :new]

  # Show welcome page by default
  root :to => 'home#index'
end
