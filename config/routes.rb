## Default
Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "articles#index"

  get "/articles",      to: "articles#index"
  get "/articles/:id",  to: "articles#show"
  
  # resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end

# Rails.application.routes.draw do
#   get 'articles/index'
#   get 'articles/hello'
#   get 'articles/new'
# end

