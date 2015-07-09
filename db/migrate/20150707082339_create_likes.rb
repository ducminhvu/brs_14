class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :status
      t.references :user
      t.references :activity

      t.timestamps null: false
    end
  end
end
