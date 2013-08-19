class RenameNameToDescription < ActiveRecord::Migration
  def change
    change_table :dreams do |t|
      t.rename :name, :description
    end
  end
end
