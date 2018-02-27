# frozen_string_literal: true

Rails.application.routes.draw do
  root 'feedbacks#index'
  resources :feedbacks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
end
