Dreamgram::Application.routes.draw do
  # Devise/account resources
  devise_for :account,
    :controllers => { :registrations => :registrations },
    :path => '',
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup' }

  authenticated :account do
    root :to => 'dreams#index', :as => :account_root
  end

  unauthenticated :account do
    root :to => 'home#index'
  end

  # REST resources
  resources :dreams, :except => [:show]
end
