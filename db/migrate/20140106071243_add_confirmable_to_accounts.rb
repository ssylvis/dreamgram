class AddConfirmableToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end
    add_index :accounts, :confirmation_token, :unique => true
  end
end
