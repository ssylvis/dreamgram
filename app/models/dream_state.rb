module DreamState
  ALL = :all
  ACTIVE = :active
  COMPLETED = :completed

  def self.value_of(string)
    return if string.blank?
    case string.downcase
    when 'all'
      ALL
    when 'active'
      ACTIVE
    when 'completed'
      COMPLETED
    end
  end
end
