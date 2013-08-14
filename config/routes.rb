Dreamgram::Application.routes.draw do
  # Welcome page
  get "home/index"

  # REST: dreams
  resources :dreams, :except => [:show]

  # Show welcome page by default
  root :to => 'home#index'
end
