50.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@brs.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end
