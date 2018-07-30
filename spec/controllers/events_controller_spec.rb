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
    before do
      user = create(:user)
      user.add_role :admin
      sign_in user

      @category = create(:category)
    end

    context 'with valid params' do
      it 'creates a new Event' do
        expect do
          post :create, params: {
            event: attributes_for(:event, category_id: @category.id)
          }
        end.to change(Event, :count).by(1)
      end

      it 'redirects to home' do
        post :create, params: {
          event: attributes_for(:event, name: 'asdf', category_id: @category.id)
        }

        event = Event.find_by(name: 'asdf').id
        expect(response).to redirect_to(event_path(event))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { event: attributes_for(:event, name: nil) }
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    before do
      user = create(:user)
      user.add_role :admin
      sign_in user

      @event = create(:event)
    end

    context 'with valid params' do
      it 'updates the Event' do
        put :update, params: { id: @event.id, event: { description: 'xnxn' } }
        @event.reload
        expect(@event.description).to eq('xnxn')
      end

      it 'redirects to home' do
        put :update, params: { id: @event.id, event: { description: 'xnxn' } }
        expect(response).to redirect_to(event_path(@event))
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      user = create(:user)
      user.add_role :admin
      sign_in user
    end

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
      expect(response).to redirect_to(home_url)
    end
  end
end
