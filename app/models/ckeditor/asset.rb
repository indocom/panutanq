# frozen_string_literal: true

# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer          not null, primary key
#  data_file_name    :string           not null
#  data_content_type :string
#  data_file_size    :integer
#  data_fingerprint  :string
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_ckeditor_assets_on_type  (type)
#
# rubocop:enable Metrics/LineLength
module Ckeditor
  class Asset < ApplicationRecord
    include Ckeditor::Orm::ActiveRecord::AssetBase
    include Ckeditor::Backend::Paperclip
  end
end
