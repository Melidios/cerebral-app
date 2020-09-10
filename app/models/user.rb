class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum status: {
    new:    0,
    paid:   1,
    cancel: 2
  }
end
