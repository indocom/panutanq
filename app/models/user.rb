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
#  avatar_file_name            :string
#  avatar_content_type         :string
#  avatar_file_size            :integer
#  avatar_updated_at           :datetime
#  provider                    :string
#  uid                         :string
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
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate
      # emails, uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session['devise.facebook_data'] &&
         session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def all_roles
    role_names = []
    role_names.push('Administrator') if has_role? :admin
    role_names.push('Event Manager') if has_role? :event_manager
    role_names.join(', ')
    # roles.pluck(:name).join(', ') if roles.pluck(:name).join(', ') != ''
  end
end
