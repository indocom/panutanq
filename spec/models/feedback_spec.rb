# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  anonymous  :boolean          default(TRUE)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it 'saves given a valid feedback' do
    feedback = buid(:feedback)
    expect(feedback.save).to be true
  end

  it 'does not save if message is empty' do
    feedback = build(:feedback, message: '      ')
    expect(feedback.save).to be false
  end

  it 'does not save if anonymous is false and
  name is empty' do
    feedback = build(:feedback, name: '')
    expect(feedback.save).to be false
  end

  it 'does not save if anonymous is false and
  email is empty' do
    feedback = build(:feedback, email: '')
    expect(feedback.save).to be false
  end

  it 'changes name and email to "Anonymous"
  if anonymous is true' do
    create(:feedback)
    expect(Feedback.first.name).to be 'Anonymous'
    expect(Feedback.first.name).to be 'Anonymous'
  end
end
