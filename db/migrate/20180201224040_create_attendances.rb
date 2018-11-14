class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.string :beacon_id, null:false
      t.string :event_in, null:false
      t.string :event_out
      t.string :event
      t.timestamps
    end
  end
end
