class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :status, presence: true

  enum status: {
    current: 0,
    paid:    1,
    cancelled:  2
  }
end
