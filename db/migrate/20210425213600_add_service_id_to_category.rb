class AddServiceIdToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :service, null: false, foreign_key: true
  end
end
