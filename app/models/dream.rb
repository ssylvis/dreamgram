class Dream < ActiveRecord::Base
  belongs_to :account

  validates :account_id, :presence => true

  scope :completed, ->(state) { find_by_state(state) }
  scope :order_by_creation, -> { order(:created_at) }

  def completed?
    completed_at.present?
  end

  def cropped?
    crop_x.present? && crop_y.present? && crop_w.present? && crop_h.present?
  end

private

  def self.find_by_state(dream_state)
    case dream_state
    when DreamState::ALL
      order_by_creation
    when DreamState::ACTIVE
      where(:completed_at => nil).order_by_creation
    when DreamState::FULFILLED
      where.not(:completed_at => nil).order_by_creation
    end
  end
end
