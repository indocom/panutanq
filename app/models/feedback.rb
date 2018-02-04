# rubocop:disable Metrics/LineLength
# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  anonymous  :boolean
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# rubocop:enable Metrics/LineLength

class Feedback < ApplicationRecord
end
