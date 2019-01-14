class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  scope :order_desc, -> {order(created_at: :desc)}
end
