class AddColumnDayEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :day, :integer
  end
end
