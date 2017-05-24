Rails.application.routes.draw do

	resources :users
	resources :attractions

	get '/signin', to: 'sessions#new'
	post '/sessions/create', to: 'sessions#create'

	post '/rides/create', to: 'rides#create'
	delete '/logout', to: "sessions#destroy"

	root to: 'users#index'
	
end