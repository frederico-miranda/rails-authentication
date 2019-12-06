class User < ApplicationRecord
  has_secure_password

  def self.new_remember_token
    Digest::SHA1.hexdigest SecureRandom.urlsafe_base64.to_s
  end

  before_create do
   self.remember_token = User.new_remember_token
  end
end
