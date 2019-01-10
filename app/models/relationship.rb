class Relationship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :friend, class_name: User.name

  private

  def create_inverse_relationship
    friend.relationships.create friend: user
  end

  def destroy_inverse_relationship
    relationship = friend.relationships.find_by friend: user
    relationship.destroy if relationship
  end

end
