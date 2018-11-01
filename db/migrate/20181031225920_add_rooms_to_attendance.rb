class AddRoomsToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_reference :attendances, :room, column: :title#, foreign_key: true

  end
end
