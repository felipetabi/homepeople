class ChageValueOfKindByDefaultPayments < ActiveRecord::Migration[6.1]
  def change
    remove_column :payments, :kind
    add_column :payments, :kind, :integer, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
