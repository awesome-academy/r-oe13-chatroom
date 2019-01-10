
30.times do |n|
  name  = "tk#{n+1}@fchat.com"
  email = "tk#{n+1}@fchat.com"
  password = "123123"
  phone_number= "0378741097"
  User.create!(name:  name, email: email, password: password,
    password_confirmation: password, phone_number: phone_number)
end
