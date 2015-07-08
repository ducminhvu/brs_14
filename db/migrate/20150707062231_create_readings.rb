class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :status

      t.timestamps null: false
    end
  end
end
