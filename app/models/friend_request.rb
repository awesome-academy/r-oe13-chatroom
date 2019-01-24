class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: User.name, foreign_key: :friend_id
  scope :incoming, -> (current_user){where friend: current_user}
  validates :user, presence: true
  validates :friend_id, presence: true, uniqueness: {scope: :user_id}
end
