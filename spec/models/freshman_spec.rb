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
  it 'saves given a valid feedback' do
    @freshman = build(:freshman)
    expect(@freshman.save).to be true
  end
end
