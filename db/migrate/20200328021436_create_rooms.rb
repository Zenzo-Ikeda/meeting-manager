class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :number ,null:false
      t.string :name

      t.timestamps
    end
  end
end
