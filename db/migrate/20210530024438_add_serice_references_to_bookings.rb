class AddSericeReferencesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :service, null: false, foreign_key: true
  end
end
