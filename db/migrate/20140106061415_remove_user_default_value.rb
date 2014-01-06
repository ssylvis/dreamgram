class RemoveUserDefaultValue < ActiveRecord::Migration
  def up
    change_column_default :dreams, :user_id, nil
  end

  def down
    change_column_default :dreams, :user_id, 0
  end
end
