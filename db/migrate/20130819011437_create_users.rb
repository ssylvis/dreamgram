class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name, :null => false
      t.string :password_digest, :null => false
      t.timestamps
    end
    add_index :users, :email, :unique => true

    add_column :dreams, :user_id, :integer, :null => false, :default => 0
    add_index :dreams, :user_id
  end
end
