require "faker"

FactoryGirl.define do
  factory :book do
    title {Faker::Name.title}
    publish_date {Faker::Date.backward 1000}
    author {Faker::Name.name}
    description {Faker::Lorem.paragraph}
  end

  trait :hasnt_category do
    before :create do |book|
      book.category = nil
    end
  end
  trait :has_category do
    before :create do |book|
      book.category = FactoryGirl.create :category
    end
  end
  trait :page_is_number do
    before :create do |book|
      book.number_page = Faker::Number.number 4
    end
  end
  trait :page_isnt_number do
    before :create do |book|
      book.number_page = "aaa"
    end
  end
end
