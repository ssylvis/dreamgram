class AddUidToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :uid, :string, :null => false, :default => ""
    add_index :accounts, :uid, :unique => true

    reversible do |dir|
      dir.up do
        Account.find_each do |user|
          user.update(:uid => SecureRandom.hex(8))
        end
        change_column_default :accounts, :uid, nil
      end
    end
  end
end
