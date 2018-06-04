# frozen_string_literal: true

# == Schema Information
#
# Table name: freshmen
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  pagename    :string           default("no_name"), not null
#

class Freshman < ApplicationRecord
  def to_param
    pagename
  end
end
