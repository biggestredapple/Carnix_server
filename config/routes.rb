Rails.application.routes.draw do
  post "/upload", to: "scales#upload"
  get "/scales/:category", to: "scales#index"
  get "/categories", to: "scales#categories"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
