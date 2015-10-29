class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :boro
      t.string :building
      t.string :street
      t.string :zipcode
      t.string :phone

      t.timestamps null: false
    end
  end
end
