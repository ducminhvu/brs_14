class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :thesis_statement
      t.integer :rating
      t.references :user
      t.references :book

      t.timestamps null: false
    end
  end
end
