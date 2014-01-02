class AddRecoverableToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
    add_index :users, :reset_password_token, :unique => true
  end
end
