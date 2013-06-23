Dreamgram::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :dreams
  get "home/index"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
