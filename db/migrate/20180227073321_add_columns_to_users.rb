class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :contact_number, :string
    add_column :users, :major, :string
    add_column :users, :graduation, :date
    add_column :users, :overseas_experience, :string
    add_column :users, :work_experience, :string
  end
end
