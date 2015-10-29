class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :inspection_date
      t.string :grade

      t.timestamps null: false
    end
  end
end
