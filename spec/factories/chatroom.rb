FactoryBot.define do
  factory :chatroom do
    name {Faker::Name.name}
    owner_id {Faker::IDNumber.unique.user_id}
  end

  # factory :invalid_chatroom, parent: :chatroom do
  #   owner_id nil
  # end

end
