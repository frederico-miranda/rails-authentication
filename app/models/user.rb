class User < ApplicationRecord
  has_secure_password

  before_create do
   self.remember_token = new_remember_token 
  end
end
