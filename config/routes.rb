Rails.application.routes.draw do

  root "static_pages#index"
  get "/profile", to: "profiles#index"
  resources :clubs
end
