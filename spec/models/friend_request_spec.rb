require "rails_helper"

RSpec.describe FriendRequest, type: :model do
  context "associations" do
    it {should belong_to(:user)}
    it {should belong_to(:friend).class_name("User")}
  end

  context "validates" do
    it {should validate_presence_of(:user)}
    it {
      should validate_presence_of(:friend)
      should validate_uniqueness_of(:friend).scoped_to(:user)
    }
  end
end
