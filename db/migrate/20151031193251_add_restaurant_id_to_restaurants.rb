class AddRestaurantIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :restaurant_id, :integer
  end
end
