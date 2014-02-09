class Account < ActiveRecord::Base
  FREE_ACCOUNT_DREAMS_LIMIT = 10
  STRING_ATTRIBUTES = %w{ email first_name last_name uid }

  devise :confirmable, :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable

  has_many :dreams, :dependent => :destroy

  validates :first_name, :presence => true

  before_create :assign_uid

  def self.find_by_uid(uid)
    where(:uid => uid).first
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def reached_dreams_limit?
    dreams.count >= FREE_ACCOUNT_DREAMS_LIMIT
  end

  def to_s
    attributes.slice(*STRING_ATTRIBUTES)
  end

  private

  def assign_uid
    self.uid = SecureRandom.hex(8)
  end
end
