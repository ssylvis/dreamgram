class AddProviderToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.string :provider
      t.string :provider_uid
    end
    add_index :accounts, [:provider, :provider_uid], :unique => true
  end
end
