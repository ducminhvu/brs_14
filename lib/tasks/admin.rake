namespace :admin do
  desc "TODO"
  task create: :environment do
    User.create! name: "admin",
      email: "admin@brs.com",
      password: "foobar11111",
      password_confirmation: "foobar11111",
      role: "admin"
  end
end
