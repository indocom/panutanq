class AddPagenameToFreshmen < ActiveRecord::Migration[5.1]
  def change
    add_column :freshmen, :pagename, :string, unique: true, null: false, default: 'no_name'
  end
end
