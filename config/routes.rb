Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #resources are sorta like data in databases
  #users can be resources
  #database of movies 
  resources :movies
  
  #default route calls movies controller, index method
  root :to => redirect('/movies')
end
