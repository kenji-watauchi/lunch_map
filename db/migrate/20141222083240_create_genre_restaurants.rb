class CreateGenreRestaurants < ActiveRecord::Migration
  def change
    create_table :genre_restaurants do |t|
      t.integer :genre_id
      t.integer :restaurant_id

      t.timestamps
    end

    add_index :genre_restaurants, :restaurant_id
     add_index :genre_restaurants, :genre_id
     add_index :genre_restaurants, [:restaurant_id, :genre_id], unique: true
  end
end
