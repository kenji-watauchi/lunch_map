class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :genre

      t.timestamps
    end
  end
end
