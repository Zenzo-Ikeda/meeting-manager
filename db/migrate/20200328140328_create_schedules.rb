class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.integer :segment
      t.string :segment_name
      t.references :room, foreign_key: true
      t.integer :status, null:false, default:0
      t.references :user, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
