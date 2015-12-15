class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i
  validates :email, presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 35 },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
