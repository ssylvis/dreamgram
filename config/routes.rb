Dreamgram::Application.routes.draw do
  # Welcome page
  get "home/index"

  # Signup/out pages
  get 'signup', :to => 'users#new'

  # REST resources
  resources :dreams, :except => [:show]
  resources :users, :only => [:create, :destroy, :new]

  # Show welcome page by default
  root :to => 'home#index'
end
