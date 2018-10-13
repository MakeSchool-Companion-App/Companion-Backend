class AddValidationToBeacons < ActiveRecord::Migration[5.1]
  def change
    change_column_null :beacons, :hardware_id, false
    change_column_null :beacons, :title, false
  end
end
