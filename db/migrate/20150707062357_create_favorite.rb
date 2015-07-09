class CreateFavorite < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :status
	  t.references :user
	  t.references :book

      t.timestamps null: false
    end
  end
end
