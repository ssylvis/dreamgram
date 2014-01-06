Dreamgram::Application.routes.draw do
  # Welcome page
  get 'home/index'

  # Devise/account resources
  devise_for :account, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup' }
  get 'account', :to => 'dreams#index', :as => :account_root

  # REST resources
  resources :dreams, :except => [:show]

  # Show welcome page by default
  root :to => 'home#index'
end
