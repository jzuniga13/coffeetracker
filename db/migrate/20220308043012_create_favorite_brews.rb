class CreateFavoriteBrews < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_brews do |t|
      t.integer :user_id
      t.integer :brew_id

      t.timestamps
    end
  end
end
