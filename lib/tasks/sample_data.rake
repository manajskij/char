namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Mesheryakov Artem",
                 email: "whoami@elk.com.ru",
                 password: "111111",
                 password_confirmation: "111111",
                 admin: true)

    seconduser = User.create!(name: "Sarkisov Sergey",
                         email: "whoami1@elk.com.ru",
                         password: "111111",
                         password_confirmation: "111111")
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@elk.com.ru"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    #noinspection RubyArgCount
    users = User.all.take(6)
    10.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.problems.create!(content: content) }
    end
  end
end