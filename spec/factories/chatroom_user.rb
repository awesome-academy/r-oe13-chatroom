require "faker"

FactoryBot.define do
  factory :chatroom do
    user_id {Faker::IDNumber.unique.user_id}
    chatroom_id {Faker::Number.chatroom_id}
  end
end
