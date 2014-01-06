class RenameUsersToAccounts < ActiveRecord::Migration
  def change
    rename_table :users, :accounts
    rename_column :dreams, :user_id, :account_id
  end
end
