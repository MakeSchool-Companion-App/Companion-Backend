class CreateControllers < ActiveRecord::Migration[5.1]
  def change
    create_table :controllers do |t|
      t.string :Attendance

      t.timestamps
    end
  end
end
