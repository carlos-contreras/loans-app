class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  enum role: { customer: 0, admin: 1 }

  validates :role, :email, :mobile_phone, :password_digest, presence: true
end
