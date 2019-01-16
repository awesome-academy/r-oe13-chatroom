class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  delegate :name, :id, to: :user, prefix: true
  scope :order_asc, -> {order(created_at: :asc)}
end
