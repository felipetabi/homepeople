class CreateWorkingSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :working_settings do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :array_hours, array: true, null: false
      t.string :array_days, array: true, null: false
      t.integer :hour_price, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
