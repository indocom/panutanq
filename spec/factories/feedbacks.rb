# frozen_string_literal: true
# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  email      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :feedback do
    name 'Calvin Tantio'
    email 'calvin@futures.com'
    anonymous false
    message 'PINUS itu apa?'
  end
end
