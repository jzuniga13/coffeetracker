class ChangeGrindSettingToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :brews, :grind_setting, :float
  end
end
