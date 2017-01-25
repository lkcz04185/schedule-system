class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.string :time_slot_index
      t.integer :day
      t.string :start_time
      t.string :finish_time
      t.timestamps
    end
  end
end
