class RemoveDateTimeFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :date_time, :datetime
  end
end
