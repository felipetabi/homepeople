class CreateBookingSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_schedules do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
