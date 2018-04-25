# frozen_string_literal: true

# == Schema Information
#
# Table name: pictures
#
#  id                   :integer          not null, primary key
#  event_id             :integer
#  post_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#
# Indexes
#
#  index_pictures_on_event_id  (event_id)
#  index_pictures_on_post_id   (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (post_id => posts.id)
#

class Picture < ApplicationRecord
  PICTURE_URL = '/event_files/:class/:attachment/:id_partition/:style/:filename'

  belongs_to :event
  has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' },
                              default_url: '/images/:style/missing.png',
                              path: ":rails_root/public#{PICTURE_URL}",
                              url: PICTURE_URL
  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\z}
end
