class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }
end
