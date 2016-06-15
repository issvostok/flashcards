class User < ApplicationRecord
  has_many :cards

  validates :password, presence: true
  validates :email, presence: true
end
