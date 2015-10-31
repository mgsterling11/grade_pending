class AddRestaurantIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :restaurant_id, :integer
  end
end
