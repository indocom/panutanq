# frozen_string_literal: true

# == Schema Information
#
# Table name: freshmen
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string           default("untitled"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  pagename    :string           default("no_name"), not null
#

require 'rails_helper'

RSpec.describe Freshman, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
