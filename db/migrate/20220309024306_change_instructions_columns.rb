class ChangeInstructionsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :instructions, :step_1_action
    remove_column :instructions, :step_2_action
    remove_column :instructions, :step_3_action
    remove_column :instructions, :step_4_action
    remove_column :instructions, :step_5_action
    remove_column :instructions, :step_1_weight
    remove_column :instructions, :step_2_weight
    remove_column :instructions, :step_3_weight
    remove_column :instructions, :step_4_weight
    remove_column :instructions, :step_5_weight
    remove_column :instructions, :step_1_time
    remove_column :instructions, :step_2_time
    remove_column :instructions, :step_3_time
    remove_column :instructions, :step_4_time
    remove_column :instructions, :step_5_time

    add_column :instructions, :step_num, :integer
    add_column :instructions, :brew_id, :integer
    add_column :instructions, :action, :string
    add_column :instructions, :weight, :integer
    add_column :instructions, :time, :integer
  end
end
