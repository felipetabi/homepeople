class RemoveDayAndHourFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :hour, :string
    remove_column :schedules, :day, :date
  end
end
