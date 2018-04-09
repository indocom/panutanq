# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success with a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')

      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns http redirection without a logged in user' do
      get :index
      expect(response).to redirect_to(user_session_path)
    end
  end

  describe 'GET #edit_personal_info' do
    it 'returns http success with a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      get :edit_personal_info, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http forbidden with a logged in user trying
    to change other user' do
      user1 = User.create(email: 'abcd@efg.com', password: 'test123')
      user2 = User.create(email: 'abc@defg.com', password: 'test123')
      sign_in user1
      get :edit_personal_info, params: { id: user2.id }
      expect(response).to have_http_status(:forbidden)
    end

    it 'redirects you to sign in without a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      post :edit_personal_info, params: { id: user.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #edit_role' do
    it 'returns http success with a logged in user that is admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      user.add_role :admin
      sign_in user
      get :edit_role, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http forbidden with a logged in user that is not admin' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      get :edit_role, params: { id: user.id }
      expect(response).to have_http_status(:forbidden)
    end

    it 'redirects you to sign in without a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      post :edit_role, params: { id: user.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #update_role' do
    it 'returns http success with a logged in user that is admin' do
      user1 = User.create(email: 'abcd@efg.com', password: 'test123')
      user2 = User.create(email: 'abcde@fg.com', password: 'test123')
      user1.add_role :admin
      sign_in user1
      post :update_role, params: { id: user2.id, 'event_manager' => '0' }
      expect(response).to redirect_to(users_path)
    end

    it 'returns http forbidden with a logged in user that is not admin' do
      user1 = User.create(email: 'abcd@efg.com', password: 'test123')
      user2 = User.create(email: 'abcde@fg.com', password: 'test123')
      sign_in user1
      post :update_role, params: { id: user2.id, 'event_manager' => '0' }
      expect(response).to have_http_status(:forbidden)
    end

    it 'redirects you to sign in without a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      post :update_role, params: { id: user.id, 'event_manager' => '0' }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #update_personal_info' do
    it 'returns http success with a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      post :update_personal_info, params: {
        id: user.id, user: { fullname: 'test' }
      }
      expect(response).to redirect_to(dashboard_path)
    end

    it 'returns http success with updated avatar' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      post :update_personal_info, params: {
        id: user.id, user: { avatar: File.read('app/assets/images/pinus-logo.png') }
      }
      expect(response).to redirect_to(dashboard_path)
      expect(user.avatar.exists?).to be true
    end

    it 'returns http success with a logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      post :update_personal_info, params: {
        id: user.id, user: { fullname: 'test' }
      }
      expect(response).to redirect_to(dashboard_path)
    end

    it 'returns http forbidden with logged in user changing other user' do
      user1 = User.create(email: 'abcd@efg.com', password: 'test123')
      user2 = User.create(email: 'abcde@fg.com', password: 'test123')
      sign_in user1
      post :update_personal_info, params: {
        id: user2.id, user: { fullname: 'test' }
      }
      expect(response).to have_http_status(:forbidden)
    end

    it 'redirects you to sign in without logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      post :update_personal_info, params: {
        id: user.id, user: { fullname: 'test' }
      }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects you to sign in when you delete your account' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      sign_in user
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'redirects you to user index when you delete other account
    provided you are admin' do
      user1 = User.create(email: 'abcd@efg.com', password: 'test123')
      user2 = User.create(email: 'abcde@fg.com', password: 'test123')
      user1.add_role :admin
      sign_in user1
      delete :destroy, params: { id: user2.id }
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns http forbidden with logged in user deleting other user' do
      user1 = User.create(email: 'abcd@efg.com', password: 'test123')
      user2 = User.create(email: 'abcde@fg.com', password: 'test123')
      sign_in user1
      delete :destroy, params: { id: user2.id }
      expect(response).to have_http_status(:forbidden)
    end

    it 'redirects you to sign in without logged in user' do
      user = User.create(email: 'abcd@efg.com', password: 'test123')
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
