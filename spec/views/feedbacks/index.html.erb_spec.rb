# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedbacks/index', type: :view do
  before(:each) do
    assign(:feedbacks, [
             Feedback.create!(
               name: 'Name',
               email: '',
               anonymous: false,
               message: 'MyText'
             ),
             Feedback.create!(
               name: 'Name',
               email: '',
               anonymous: false,
               message: 'MyText'
             )
           ])
  end

  it 'renders a list of feedbacks' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
