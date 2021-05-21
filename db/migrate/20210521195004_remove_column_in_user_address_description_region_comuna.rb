class RemoveColumnInUserAddressDescriptionRegionComuna < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :address
    remove_column :users, :description
    remove_column :users, :region
    remove_column :users, :comuna
  end
end
