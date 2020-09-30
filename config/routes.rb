Rails.application.routes.draw do
  resources :users do
    resources :reviews
  end
  resources :genres
  resources :actors
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
