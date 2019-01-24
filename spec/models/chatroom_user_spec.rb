require "rails_helper"

RSpec.describe ChatroomUser, type: :model do
  context "associations" do
    it {should belong_to(:user)}
    it {should belong_to(:chatroom)}
  end
end
