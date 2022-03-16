class AddStyletoBrews < ActiveRecord::Migration[6.0]
  def change
    add_column :brews, :style, :string
  end
end
