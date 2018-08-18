# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FreshmenController, type: :controller do
  describe 'GET #index' do
    it 'returns http success with a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')

      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns http redirection without a logged in user' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success with a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :show, params: { id: article.pagename }
      expect(response).to have_http_status(:success)
    end

    it 'returns http success without a logged in user' do
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :show, params: { id: article.pagename }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success with a logged in user that is admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      user.add_role :admin
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'returns http forbidden with a logged in user that is not admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      get :new
      expect(response).to have_http_status(:forbidden)
    end

    it 'returns http forbidden without a logged in user' do
      get :new
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'POST #create' do
    it 'returns http redirection with a logged in user that is admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      user.add_role :admin
      sign_in user
      get :create, params: { freshman: attributes_for(:freshman) }
      expect(response).to have_http_status(:redirect)
    end

    it 'returns http forbidden with a logged in user that is not admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      get :create, params: { freshman: attributes_for(:freshman) }
      expect(response).to have_http_status(:forbidden)
    end

    it 'returns http forbidden without a logged in user' do
      get :create, params: { freshman: attributes_for(:freshman) }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'GET #edit' do
    it 'returns http success with a logged in user that is admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      user.add_role :admin
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :edit, params: { id: article.pagename }
      expect(response).to have_http_status(:success)
    end

    it 'returns http forbidden with a logged in user that is not admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :edit, params: { id: article.pagename }
      expect(response).to have_http_status(:forbidden)
    end

    it 'returns http forbidden without a logged in user' do
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :edit, params: { id: article.pagename }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'POST #update' do
    it 'returns http redirection with a logged in user that is admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      user.add_role :admin
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :update, params: { id: article.pagename,
                             freshman: attributes_for(:freshman) }
      expect(response).to have_http_status(:redirect)
    end

    it 'returns http forbidden with a logged in user that is not admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :update, params: { id: article.pagename,
                             freshman: attributes_for(:freshman) }
      expect(response).to have_http_status(:forbidden)
    end

    it 'returns http forbidden without a logged in user' do
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      get :update, params: { id: article.pagename,
                             freshman: attributes_for(:freshman) }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success with a logged in user that is admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      user.add_role :admin
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      delete :destroy, params: { id: article.pagename }
      expect(response).to have_http_status(:redirect)
    end

    it 'returns http forbidden with logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      delete :destroy, params: { id: article.pagename }
      expect(response).to have_http_status(:forbidden)
    end

    it 'returns http forbidden without logged in user' do
      article = Freshman.create(name: 'test', pagename: 'test',
                                description: 'test')
      delete :destroy, params: { id: article.pagename }
      expect(response).to have_http_status(:forbidden)
    end
  end
end
