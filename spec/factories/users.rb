FactoryGirl.define do
  sequence(:email, 1000) {|n| "Cristiano_Ronaldo_#{n}@gmailldadsadlll.com"}
  sequence(:name) {|n| "#{n}"}

  factory :user do
    name
    password "12345678"
    email
  end
end
