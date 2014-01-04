class User < ActiveRecord::Base
  FREE_ACCOUNT_DREAMS_LIMIT = 10

  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable

  has_many :dreams, :dependent => :destroy

  validates :name, :presence => true

  def reached_dreams_limit?
    dreams.count >= FREE_ACCOUNT_DREAMS_LIMIT
  end
end
