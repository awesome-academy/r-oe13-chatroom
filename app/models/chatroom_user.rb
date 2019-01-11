class ChatroomUser < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  scope :by_user, -> (user_id){where user_id: user_id}
  delegate :name, to: :user
end
