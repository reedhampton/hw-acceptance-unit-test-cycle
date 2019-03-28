Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  #Add the route for the sim search
  get 'sim_movies/:title' => 'movies#sim_search', as: :sim_search

end
