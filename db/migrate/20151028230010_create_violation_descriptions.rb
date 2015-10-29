class CreateViolationDescriptions < ActiveRecord::Migration
  def change
    create_table :violation_descriptions do |t|
      t.string :violation_code
      t.string :violation_description
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
