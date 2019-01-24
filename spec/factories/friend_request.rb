require "faker"

FactoryBot.define do
  factory :friend_request do
    after(:build) do |friend_request|
      user = FactoryBot.create :user
      friend = FactoryBot.create :user

      friend_request.user_id = user.id
      friend_request.friend_id = friend.id
    end
  end
end
