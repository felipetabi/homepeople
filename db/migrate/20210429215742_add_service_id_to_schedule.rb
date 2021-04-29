class AddServiceIdToSchedule < ActiveRecord::Migration[6.1]
  def change
    add_reference :schedules, :service, null: false, foreign_key: true
  end
end
