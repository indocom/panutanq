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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  rolify
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  def all_roles
    role_names = []
    role_names.push('Administrator') if has_role? :admin
    role_names.push('Event Manager') if has_role? :event_manager
    role_names.join(', ')
    # roles.pluck(:name).join(', ') if roles.pluck(:name).join(', ') != ''
  end
end
