# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedbacks/edit', type: :view do
  before(:each) do
    @feedback = assign(:feedback, Feedback.create!(
                                    name: 'MyString',
                                    email: '',
                                    anonymous: false,
                                    message: 'MyText'
    ))
  end

  it 'renders the edit feedback form' do
    render

    assert_select 'form[action=?][method=?]',
                  feedback_path(@feedback), 'post' do
      assert_select 'input[name=?]', 'feedback[name]'

      assert_select 'input[name=?]', 'feedback[email]'

      assert_select 'input[name=?]', 'feedback[anonymous]'

      assert_select 'textarea[name=?]', 'feedback[message]'
    end
  end
end
