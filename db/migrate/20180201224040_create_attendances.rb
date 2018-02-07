class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.string :beacon_id, null:false
      t.string :event, null:false
      t.time :event_time, null:false
      t.timestamps
    end
  end
end
