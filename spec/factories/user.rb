require "faker"

FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password "123123"
    phone_number {Faker::Number.leading_zero_number(10)}
  end
end
