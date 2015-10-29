class CreateCuisineTypes < ActiveRecord::Migration
  def change
    create_table :cuisine_types do |t|
      t.string :cuisine_description
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
