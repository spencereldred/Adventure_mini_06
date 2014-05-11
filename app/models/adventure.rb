class Adventure < ActiveRecord::Base
  belongs_to :library
  has_many :pages

  before_create :add_guid

  def add_guid
    self.guid ||= SecureRandom.urlsafe_base64(10)
  end
end
