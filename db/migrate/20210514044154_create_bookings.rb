class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :client_id, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.boolean :confirm_client, default: false
      t.boolean :confirm_service, default: false
      
      t.integer :status, default: 2
      t.timestamps
    end
  end
end
