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

require 'rails_helper'

RSpec.describe Feedback, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
