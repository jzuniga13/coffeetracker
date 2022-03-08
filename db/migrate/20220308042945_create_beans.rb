class CreateBeans < ActiveRecord::Migration[6.0]
  def change
    create_table :beans do |t|
      t.integer :roaster_id
      t.string :name
      t.string :country_of_origin
      t.datetime :roast_date
      t.string :process
      t.string :roast_level

      t.timestamps
    end
  end
end
