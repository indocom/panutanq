# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  email                       :string           default(""), not null
#  encrypted_password          :string           default(""), not null
#  reset_password_token        :string
#  reset_password_sent_at      :datetime
#  remember_created_at         :datetime
#  sign_in_count               :integer          default(0), not null
#  current_sign_in_at          :datetime
#  last_sign_in_at             :datetime
#  current_sign_in_ip          :inet
#  last_sign_in_ip             :inet
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  fullname                    :string
#  contact_number              :string
#  major                       :string
#  graduation                  :date
#  overseas_experience         :string
#  work_experience             :string
#  display_email               :boolean
#  display_contact_number      :boolean
#  display_major               :boolean
#  display_graduation          :boolean
#  display_overseas_experience :boolean
#  display_work_experience     :boolean
#  provider                    :string
#  uid                         :string
#  avatar_file_name            :string
#  avatar_content_type         :string
#  avatar_file_size            :integer
#  avatar_updated_at           :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves given a valid User' do
    user = User.new(email: 'test@abc.com', password: 'test123')
    expect(user.save).to be true
  end

  it 'does not save if email is empty' do
    user = User.new(email: '', password: 'test123')
    expect(user.save).to be false
  end

  it 'does not save if password is not a combination of
  letters and numbers' do
    user = User.new(email: 'test@abc.com', password: 'test123')
    expect(user.save).to be true
  end
end
