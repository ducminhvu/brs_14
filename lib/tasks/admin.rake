namespace :admin do
  desc "TODO"
  task create: :environment do
    User.create! name: "admin"
      email: "admin@brs.com",
      password: "foobar",
      password_confirmation: "foobar",
      admin: true
  end
end
