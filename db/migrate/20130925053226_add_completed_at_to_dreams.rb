class AddCompletedAtToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :completed_at, :datetime
  end
end
