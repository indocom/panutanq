# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string
#  description :text
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_event_id     (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (event_id => events.id)
#
# rubocop:enable Metrics/LineLength

FactoryBot.define do
  factory :post do
    category nil
    name 'MyString'
    description 'MyText'
  end
end
