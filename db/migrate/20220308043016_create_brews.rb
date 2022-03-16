class CreateBrews < ActiveRecord::Migration[6.0]
  def change
    create_table :brews do |t|
      t.integer :bean_id
      t.integer :user_id
      t.integer :device_id
      t.integer :grind_setting
      t.string :flavors
      t.string :grinder
      t.string :water_temp
      t.string :comments
      t.integer :instructions_id

      t.timestamps
    end
  end
end
