# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe FeedbacksController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      feedback = create(:feedback)
      get :show, params: { id: feedback.id }
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
      it 'creates a new Feedback' do
        expect do
          post :create, params: { feedback: attributes_for(:feedback) }
        end.to change(Feedback, :count).by(1)
      end

      it 'redirects to the created feedback' do
        post :create, params: { feedback: attributes_for(:feedback) }
        expect(response).to redirect_to(Feedback.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { feedback: attributes_for(:feedback, name: nil) }
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested feedback' do
      feedback = create(:feedback)
      expect do
        delete :destroy, params: { id: feedback.id }
      end.to change(Feedback, :count).by(-1)
    end

    it 'redirects to the feedbacks list' do
      feedback = create(:feedback)
      delete :destroy, params: { id: feedback.id }
      expect(response).to redirect_to(feedbacks_url)
    end
  end
end
