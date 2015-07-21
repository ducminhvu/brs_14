class CreateFavorite < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :book

      t.timestamps null: false
    end
    add_index :favorites, [:user_id, :book_id], unique: true
  end
end
