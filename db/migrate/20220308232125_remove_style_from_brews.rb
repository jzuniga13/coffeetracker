class RemoveStyleFromBrews < ActiveRecord::Migration[6.0]
  def change
    remove_column :brews, :style
  end
end
