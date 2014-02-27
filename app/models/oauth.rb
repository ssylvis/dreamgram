class Oauth < ActiveRecord::Base
  belongs_to :account

  validates :provider, :presence => true
  validates :provider_uid, :presence => true

  def self.find_by_provider(provider, uid)
    where(:provider => provider, :provider_uid => uid).first
  end
end
