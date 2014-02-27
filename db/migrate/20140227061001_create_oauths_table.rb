class CreateOauthsTable < ActiveRecord::Migration
  def change
    create_table :oauths do |t|
      t.integer :account_id
      t.string :provider
      t.string :provider_uid
    end
    add_index :oauths, [:provider, :provider_uid], :unique => true

    reversible do |dir|
      dir.up do
        Account.find_each do |account|
          Oauth.create(
            :account => account,
            :provider => account.provider,
            :provider_uid => account.provider_uid
          )
        end
      end
    end

    remove_column :accounts, :provider, :string
    remove_column :accounts, :provider_uid, :string
  end
end
