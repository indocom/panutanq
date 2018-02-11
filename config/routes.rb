# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  resources :users, except: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'create_user' => 'users#create', as: :create_user      
end
