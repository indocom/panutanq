# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  category_id :integer
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  start_time  :date
#  end_time    :date
#
# Indexes
#
#  index_events_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

FactoryBot.define do
  factory :event do
    category
    description 'MyText'
    start_time '2018-01-31 20:25:54'
    end_time '2018-01-31 20:25:54'
    name 'MyString'
  end
end
