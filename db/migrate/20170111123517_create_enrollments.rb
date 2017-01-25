class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :time_slot_id
      t.date :date
      t.timestamps
    end
  end
end
