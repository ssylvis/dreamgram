Dreamgram::Application.routes.draw do
  # Devise/account resources
  devise_for :account,
    :controllers => { :registrations => :registrations },
    :path => '',
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup' }

  authenticated :account do
    root :to => 'users#show', :as => :account_root
  end

  unauthenticated :account do
    root :to => 'home#show'
  end

  # REST resources
  resources :dreams, :except => [:index, :show]
  resources :users, :param => :uid, :only => [:show]

  # Exceptions
  match '404', :to => 'errors#not_found', :via => :all
  match '500', :to => 'errors#internal_error', :via => :all
end
