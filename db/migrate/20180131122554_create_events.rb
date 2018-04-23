class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :category, foreign_key: true
      t.text :description
      t.time :start_time
      t.time :end_time
      t.string :name

      t.timestamps
    end
  end
end
