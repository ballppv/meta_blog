Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] 
  # now we have all of resources so we don't need only to fix it
  resources :articles
end
