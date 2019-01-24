require "rails_helper"

RSpec.describe Chatroom, type: :model do
  context "associations" do
    it {should have_many(:chatroom_users).dependent(:destroy)}
    it {should have_many(:users).through(:chatroom_users)}
    it {should have_many(:messages).dependent(:destroy)}
  end
end
