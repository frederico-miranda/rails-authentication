# frozen_string_literal: true

EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

class User < ApplicationRecord
  has_many :posts
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: true

  def self.new_remember_token
    Digest::SHA1.hexdigest SecureRandom.urlsafe_base64.to_s
  end

  before_create do
    self.remember_token = User.new_remember_token
  end
end
