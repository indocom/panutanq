class AddDisplayColumnsForUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :display_email, :boolean
    add_column :users, :display_contact_number, :boolean
    add_column :users, :display_major, :boolean
    add_column :users, :display_graduation, :boolean
    add_column :users, :display_overseas_experience, :boolean
    add_column :users, :display_work_experience, :boolean
  end
end
