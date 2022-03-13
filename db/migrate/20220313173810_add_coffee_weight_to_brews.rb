class AddCoffeeWeightToBrews < ActiveRecord::Migration[6.0]
  def change
    add_column :brews, :coffee_weight, :integer
  end
end
