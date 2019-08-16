Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # NOTE: quirky thing about rails, root resourceS are plural EXCEPT for SESSION. Because
  # security feature is to log a user out if they log in on another client, there is only one
  # session per user and only one resource. So SESSION has a singular RESOURCE.  
  
  # root to: 'controller#action' is the same as root 'controller#action'
  # just wanted to be explicit for "stand alone" pages that don't need 
  # resources per se, though you could do resources and only: [:show]
  root to: 'welcome#home'
  # simple get for the about page 
  get 'welcome/about', to: 'welcome#about'

  resources :contacts
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  
end
