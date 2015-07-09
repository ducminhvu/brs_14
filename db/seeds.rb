50.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@brs.com"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end

50.times do |n|
  name = Faker::Lorem.sentence 1
  description = Faker::Lorem.sentence 6
  author = Faker::Name.name
  bought = rand(2) == 1 ? true : false
  Request.create!(book_name: name, description: description,
    author: author, user_id: n+2, bought: bought)
end
