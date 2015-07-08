class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :status
      t.references :user
      t.references :book

      t.timestamps null: false
    end
  end
end
