class RemoveAddressFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :address
  end
end
