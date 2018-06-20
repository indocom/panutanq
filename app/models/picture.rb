# frozen_string_literal: true

# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pictures_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#

class Picture < ApplicationRecord
  belongs_to :event
  belongs_to :post
end
