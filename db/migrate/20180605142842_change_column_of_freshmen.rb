class ChangeColumnOfFreshmen < ActiveRecord::Migration[5.1]
  def change
    change_column :freshmen, :name, :string, null: false, default: "untitled"
  end
end
