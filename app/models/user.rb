class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  has_many :dreams, :dependent => :destroy

  attr_accessible :email, :name
  attr_accessible :password, :password_confirmation

  validates :name, :presence => true
end
