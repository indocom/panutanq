class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
