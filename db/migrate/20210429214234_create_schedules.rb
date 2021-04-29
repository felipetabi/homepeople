class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :date_time
      t.integer :price
      t.boolean :is_closed

      t.timestamps
    end
  end
end
