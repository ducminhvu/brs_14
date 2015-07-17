class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :action_type
      t.integer :object_relative_id
      t.references :user

      t.timestamps null: false
    end
  end
end
