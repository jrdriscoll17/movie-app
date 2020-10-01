# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create show] do
    resources :reviews
  end

  resources :movies do
    resources :reviews
  end

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  post 'logout' => 'session#destroy'
end
