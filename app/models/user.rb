class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable

  has_many :dreams, :dependent => :destroy

  attr_accessible :email
  attr_accessible :name
  attr_accessible :password, :password_confirmation
  attr_accessible :remember_me

  validates :name, :presence => true
end
