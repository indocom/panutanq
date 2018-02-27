# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit',
        :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :users, except: :create
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  post 'create_user' => 'users#create', :as => 'create_user'
  patch 'edit_user/:id' => 'users#authorize', :as => 'edit_user_authority'
end
