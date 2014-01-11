Dreamgram::Application.routes.draw do
  # Welcome page
  get 'home/index'

  # Devise/account resources
  devise_for :account, :controllers => { :registrations => :registrations },
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup' }

  # REST resources
  resources :dreams, :except => [:show]

  # Show welcome page by default
  root :to => 'home#index'
end
