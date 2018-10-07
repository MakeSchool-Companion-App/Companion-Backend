class CreateBeacons < ActiveRecord::Migration[5.1]
  def change
    create_table :beacons do |t|
      t.string :hardware_id
      t.string :title

      t.timestamps
    end
    add_index :beacons, :hardware_id, unique: true # Multiple beacons for same location, not the same beacon

  end
end
