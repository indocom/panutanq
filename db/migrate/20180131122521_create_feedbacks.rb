class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.boolean :anonymous, :default => true
      t.text :message

      t.timestamps
    end
  end
end
