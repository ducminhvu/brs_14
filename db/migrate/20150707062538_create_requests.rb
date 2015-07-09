class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :book_name
      t.string :description
      t.string :author
      t.boolean :bought, default: false 
      t.references :user

      t.timestamps null: false
    end
  end
end
