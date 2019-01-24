require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it {should have_many(:chatroom_users)}
    it {should have_many(:chatrooms).through(:chatroom_users).with_foreign_key("owner_id")}
    it {should have_many(:messages)}
    it {should have_many(:relationships).dependent(:destroy)}
    it {should have_many(:friends).through(:relationships)}
    it {should have_many(:friend_request).dependent(:destroy)}
    it {should have_many(:pending_friends).through(:friend_request).source(:friend)}
    it {should have_secure_password}
  end

  context "validates" do
    it {
      should validate_presence_of(:name)
      should validate_length_of(:name).is_at_most(Settings.max_name)
    }
    it {
      should validate_presence_of(:email)
      should allow_values("foobar@gmail.com").for(:email)
      should validate_length_of(:email).is_at_most(Settings.max_email)
    }
    it{
      should validate_presence_of(:password)
      should validate_length_of(:password).is_at_least(Settings.min_pass)
    }
    it {
      should validate_numericality_of(:phone_number)
      should validate_length_of(:phone_number).is_at_least(Settings.min_phone)
      should validate_length_of(:phone_number).is_at_most(Settings.max_phone)
    }
  end
end
