class AddIsVerifiedToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :is_verified, :boolean, default: false
  end
end
