class User < ActiveRecord::Base
  has_many :dreams, :dependent => :destroy
  has_secure_password

  attr_accessible :email, :name
  attr_accessible :password, :password_confirmation

  validates :email, :uniqueness => true
  validates :name, :presence => true
  validates :password, :length => { :minimum => 1 }

  before_save :sanitize_email

private

  def sanitize_email
    self.email = email.downcase
  end
end
