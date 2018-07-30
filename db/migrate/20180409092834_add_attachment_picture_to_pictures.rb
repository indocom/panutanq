class AddAttachmentPictureToPictures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :pictures, :picture
  end
end
