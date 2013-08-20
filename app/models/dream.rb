class Dream < ActiveRecord::Base
  attr_accessible :description, :image

  belongs_to :user
  validates :user_id, :presence => true
end
