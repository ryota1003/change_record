class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true

  has_secure_password

  has_many :commodities
end
