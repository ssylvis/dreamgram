class DeviseModifyUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :encrypted_password, :null => false, :default => ""
      t.remove :password_digest
    end
    change_column_default :users, :encrypted_password, nil
  end

  def down
    change_table :users do |t|
      t.string :password_digest, :null => false, :default => ""
      t.remove :encrypted_password
    end
    change_column_default :users, :password_digest, nil
  end
end
