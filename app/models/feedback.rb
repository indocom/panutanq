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
# rubocop:enable Metrics/LineLength

class Feedback < ApplicationRecord
end
