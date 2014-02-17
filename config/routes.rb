Dreamgram::Application.routes.draw do
  # Devise/account resources
  devise_for :account,
    :controllers => { :omniauth_callbacks => 'authentication', :registrations => :registrations },
    :path => '',
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup' }

  devise_scope :account do
    get 'login', :to => 'devise/sessions#new', :as => :new_account_session
    delete 'logout', :to => 'devise/sessions#destroy', :as => :destroy_account_session
  end

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
