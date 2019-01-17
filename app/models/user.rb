class User < ApplicationRecord
  before_save { self.email_address = email_address.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  validates :first_name,
            presence: true,
            length: { maximum: 24 }
  validates :last_name,
            presence: true,
            length: { maximum: 24 }
  has_secure_password
end
