class AddImageToRoasters < ActiveRecord::Migration[6.0]
  def change
    add_column :roasters, :image, :string
  end
end
