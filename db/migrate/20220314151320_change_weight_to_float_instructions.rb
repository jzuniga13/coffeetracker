class ChangeWeightToFloatInstructions < ActiveRecord::Migration[6.0]
  def change
    change_column :instructions, :weight, :float
  end
end
