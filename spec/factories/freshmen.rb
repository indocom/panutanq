# rubocop:disable Metrics/LineLength
# == Schema Information
#
# Table name: freshmen
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# rubocop:enable Metrics/LineLength

FactoryBot.define do
  factory :freshman do
    description "MyText"
    name "MyString"
  end
end
