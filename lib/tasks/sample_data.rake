namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@allsparks.com",
                 password: "barfoo",
                 password_confirmation: "barfoo",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@allsparks.com"
      password  = "sparks!"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
       50.times do
         content = Faker::Lorem.sentence(5)
         users.each { |user| user.microposts.create!(content: content) }
       end
  end
end