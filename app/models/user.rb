class User < ApplicationRecord
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users, foreign_key: "owner_id"
  has_many :messages
  has_many :relationalships
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.min_pass}, allow_nil: true
end
