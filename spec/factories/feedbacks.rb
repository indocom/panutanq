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

FactoryBot.define do
  factory :feedback do
    email 'MyString'
    message 'MyText'
  end
end
