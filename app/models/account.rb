class Account < ActiveRecord::Base
  include Application::OauthHandling

  FREE_ACCOUNT_DREAMS_LIMIT = 10

  devise :confirmable, :registerable, :rememberable
  devise :omniauthable, :omniauth_providers => [:facebook, :google]

  has_many :dreams, :dependent => :destroy

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :provider, :presence => true
  validates :provider_uid, :presence => true
  validates :uid, :presence => true

  before_validation :assign_uid, :only => :create

  def self.find_by_email(email)
    where(:email => email).first
  end

  def self.find_by_provider(provider, uid)
    where(:provider => provider, :provider_uid => uid).first
  end

  def self.find_by_uid(uid)
    where(:uid => uid).first!
  end

  # Called by Devise registrations controller
  def self.new_with_session(params, session)
    super.tap do |account|
      if oauth = oauth_data(session)
        account.email ||= oauth[:email]
        account.first_name ||= oauth[:first_name]
        account.last_name ||= oauth[:last_name]
        account.provider ||= oauth[:provider]
        account.provider_uid ||= oauth[:provider_uid]
      end
    end
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
