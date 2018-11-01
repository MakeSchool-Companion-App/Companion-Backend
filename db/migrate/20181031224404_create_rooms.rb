class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms, id: false, primary_key: :title do |t|
      t.string :title

      t.timestamps
    end
    add_index :rooms, :title, unique: true
  end
end
