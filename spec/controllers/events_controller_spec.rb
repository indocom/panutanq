# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      user = create(:user)
      user.add_role :admin

      sign_in user

      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      event = create(:event)

      user = create(:user)
      user.add_role :admin

      sign_in user

      get :show, params: { id: event.id }
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Event' do
        expect do
          post :create, params: { event: attributes_for(:event) }
        end.to change(Event, :count).by(1)
      end

      it 'redirects to home' do
        post :create, params: { event: attributes_for(:event) }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { event: attributes_for(:event, name: nil) }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested event' do
      event = create(:event)

      user = create(:user)
      user.add_role :admin

      sign_in user

      expect do
        delete :destroy, params: { id: event.id }
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      event = create(:event)

      user = create(:user)
      user.add_role :admin

      sign_in user

      delete :destroy, params: { id: event.id }
      expect(response).to redirect_to(events_url)
    end
  end
end
