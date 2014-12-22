class AddColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :comment, :text
  end
end
