Dreamgram::Application.routes.draw do
  # Welcome page
  get "home/index"

  # Devise/user resources
  devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }

  # REST resources
  resources :dreams, :except => [:show]

  # Show welcome page by default
  root :to => 'home#index'
end
