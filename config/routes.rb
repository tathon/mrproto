Mrproto::Application.routes.draw do
	resources :sessions, :only => [:new, :create, :destroy]
	
  match '/signin',	:to => 'sessions#new'
  match '/signout',	:to => 'sessions#destroy'
  
  match '/ps451',		:to => 'reports#ps451'

  root :to => 'pages#home'
end
