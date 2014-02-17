class RemovePasswordFromAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at

      t.string :remember_token
    end
  end
end
