class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  scope :incoming, -> (current_user){where friend: current_user}

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: {scope: :user}
end
