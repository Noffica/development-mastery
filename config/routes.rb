## Default
Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "articles#index"

  resources :articles
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
