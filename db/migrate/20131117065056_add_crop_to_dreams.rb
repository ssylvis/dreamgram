class AddCropToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :crop_x, :integer
    add_column :dreams, :crop_y, :integer
    add_column :dreams, :crop_w, :integer
    add_column :dreams, :crop_h, :integer
  end
end
