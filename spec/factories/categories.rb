require "faker"

FactoryGirl.define do
  factory :category do
    name {Faker::Name.title}
    content {Faker::Lorem.paragraph}
  end
end
