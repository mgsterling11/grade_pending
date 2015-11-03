class ResetPrimaryKeyViolations < ActiveRecord::Migration
  def change
    change_column :violation_descriptions, :id, :integer, :default=>1
  end
end
