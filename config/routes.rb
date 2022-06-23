## Default
# Rails.application.routes.draw do
#   resources :widgets
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   root "articles#index"
# end

Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/hello'
end

