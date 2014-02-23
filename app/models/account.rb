class Account < ActiveRecord::Base
  FREE_ACCOUNT_DREAMS_LIMIT = 10

  devise :confirmable, :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable

  has_many :dreams, :dependent => :destroy

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :uid, :presence => true

  before_validation :assign_uid, :only => :create

  def self.find_by_uid(uid)
    where(:uid => uid).first!
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def reached_dreams_limit?
    dreams.count >= FREE_ACCOUNT_DREAMS_LIMIT
  end

  private

  def assign_uid
    self.uid = SecureRandom.hex(8)
  end
end
