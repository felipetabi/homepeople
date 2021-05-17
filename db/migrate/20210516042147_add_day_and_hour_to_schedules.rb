class AddDayAndHourToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :day, :date
    add_column :schedules, :hour, :string
  end
end
