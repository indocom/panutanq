# frozen_string_literal: true

# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pictures_on_event_id  (event_id)
#  index_pictures_on_post_id   (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (post_id => posts.id)
#
# rubocop:enable Metrics/LineLength

class Picture < ApplicationRecord
  belongs_to :event
  belongs_to :post
end
