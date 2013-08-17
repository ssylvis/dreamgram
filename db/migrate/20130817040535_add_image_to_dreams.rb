class AddImageToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :image, :string
  end
end
