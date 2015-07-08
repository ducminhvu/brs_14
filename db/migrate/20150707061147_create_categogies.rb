class CreateCategogies < ActiveRecord::Migration
  def change
    create_table :categogies do |t|
      t.string :name
      t.string :content

      t.timestamps null: false
    end
  end
end
