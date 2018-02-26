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

class Feedback < ApplicationRecord
	validates :name, presence: true, unless: :anonymous?
	validates :email, presence: true, unless: :anonymous?
	validates :message, presence: true

	def anonymous?
		anonymous == true
	end
end
