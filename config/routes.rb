Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #resources are sorta like data in databases
  #users can be resources
  #database of movies 
  resources :movies
  
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  #default route calls movies controller, index method
  root :to => redirect('/movies')
end
