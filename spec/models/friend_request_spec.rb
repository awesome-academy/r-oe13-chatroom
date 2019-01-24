require "rails_helper"

RSpec.describe FriendRequest, type: :model do
  context "associations" do
    it {should belong_to(:user)}
    it {should belong_to(:friend).class_name("User")}
  end

  context "validates" do
    it {should validate_presence_of(:user)}
    it {
      subject {FactoryBot.create(:user)}
      subject {FactoryBot.create(:friend_request)}
      should validate_presence_of(:friend_id)
      should validate_uniqueness_of(:friend_id).scoped_to(:user_id)
    }
  end
end
