class AddFirstLastNameToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.rename :name, :first_name
      t.string :last_name
    end

    reversible do |dir|
      dir.up do
        Account.find_each do |account|
          name_parts = account.first_name.split
          first_name = name_parts[0]
          last_name = name_parts[1..-1].join(' ')
          account.update(:first_name => first_name, :last_name => last_name)
        end
      end
    end
  end
end
