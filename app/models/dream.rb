class Dream < ActiveRecord::Base
  belongs_to :account

  validates :description, :presence => true

  scope :completed, -> { find_by_state(DreamState::COMPLETED) }
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
    when DreamState::ACTIVE
      where(:completed_at => nil)
    when DreamState::COMPLETED
      where.not(:completed_at => nil)
    end
  end
end
