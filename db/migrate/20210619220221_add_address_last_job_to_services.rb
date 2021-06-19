class AddAddressLastJobToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :address_last_job, :string
  end
end
