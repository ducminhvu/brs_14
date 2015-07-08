class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.datetime :publish_date
      t.string :author
      t.integer :number_page
      t.integer :rating
      t.string :description
      t.string :picture
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
