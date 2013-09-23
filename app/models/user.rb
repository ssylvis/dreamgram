class User < ActiveRecord::Base
  attr_accessible :email, :name
  attr_accessible :password, :password_confirmation

  has_many :dreams, :dependent => :destroy
  has_secure_password

  before_save :sanitize_email

  validates :email, :uniqueness => true
  validates :password, :length => { :minimum => 1 }

private

  def sanitize_email
    self.email = email.downcase
  end
end
