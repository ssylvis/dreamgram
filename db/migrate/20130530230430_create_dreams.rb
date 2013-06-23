class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :name, :null => false
      t.boolean :completed
      t.datetime :completed_at
      t.datetime :created_at, :null => false
    end
  end
end
