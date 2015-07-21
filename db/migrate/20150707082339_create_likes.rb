class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :activity

      t.timestamps null: false
    end
    add_index :likes, [:user_id, :activity_id], unique: true
  end
end
