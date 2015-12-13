class User < ActiveRecord::Base
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i
  validates :email, presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 35 },
            format: { with: VALID_EMAIL_REGEX }
end
