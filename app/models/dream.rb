class Dream < ActiveRecord::Base
  attr_accessible :completed_at, :description, :image

  belongs_to :user
  validates :user_id, :presence => true

  scope :completed, ->(state) { find_by_state(state) }
  scope :order_by_creation, -> { order(:created_at) }

  def completed?
    completed_at.present?
  end

private

  def self.find_by_state(dream_state)
    case dream_state
    when DreamState::ALL
      order_by_creation
    when DreamState::ACTIVE
      where(:completed_at => nil).order_by_creation
    when DreamState::FULFILLED
      where(self.arel_table[:completed_at].not_eq(nil)).order_by_creation
    end
  end
end
