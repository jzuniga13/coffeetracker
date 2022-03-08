class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.string :step_1_action
      t.integer :step_1_weight
      t.integer :step_1_time
      t.string :step_2_action
      t.integer :step_2_weight
      t.integer :step_2_time
      t.string :step_3_action
      t.integer :step_3_weight
      t.integer :step_3_time
      t.string :step_4_action
      t.integer :step_4_weight
      t.integer :step_4_time
      t.string :step_5_action
      t.integer :step_5_weight
      t.integer :step_5_time

      t.timestamps
    end
  end
end
