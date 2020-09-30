# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show] do
    resources :reviews
  end
  resources :genres
  resources :actors
  resources :movies

  get 'login' => 'session#new'
  post 'login' => 'session#create'
end
