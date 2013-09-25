class Dream < ActiveRecord::Base
  attr_accessible :description, :image

  belongs_to :user
  validates :user_id, :presence => true

  scope :order_by_creation, -> { order(:created_at) }
end
