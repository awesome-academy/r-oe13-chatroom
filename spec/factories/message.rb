require "faker"

FactoryBot.define do
  factory :message do
    body {Faker::Football.body}
    user_id {Faker::IDNumber.user_id}
    chatroom_id {Faker::IDNumber.chatroom_id}
  end
end
