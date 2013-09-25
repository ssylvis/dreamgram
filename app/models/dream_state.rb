module DreamState
  ALL = :all
  ACTIVE = :active
  FULFILLED = :fulfilled

  def self.value_of(string)
    return if string.blank?
    case string.downcase
    when 'all'
      ALL
    when 'active'
      ACTIVE
    when 'fulfilled'
      FULFILLED
    end
  end
end
