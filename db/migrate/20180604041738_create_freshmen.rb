class CreateFreshmen < ActiveRecord::Migration[5.1]
  def change
    create_table :freshmen do |t|
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
