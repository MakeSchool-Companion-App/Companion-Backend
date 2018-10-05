class RemoveBeaconIdFromAttendances < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendances, :beacon_id, :string
  end
end
