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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
