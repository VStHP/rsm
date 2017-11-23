1.upto(5) do |x|
  name = Faker::Name.name
  email = "user#{x}@gmail.com"
  pass = "123123"
  pass_conf = "123123"
  User.create!(name: name, email: email, password: pass, password_confirmation: pass_conf)
end

1.upto(5) do |x|
  name1 =   Faker::Team.creature << " Club"
  position1 = Faker::Job.title
  name2 =   Faker::Team.creature << " Club"
  position2 = Faker::Job.title
  content = Faker::Lorem.paragraph
  Club.create!(name: name1, user_id: x, position: position1,
    start_time: Time.zone.today-50, end_time: Time.zone.today-12, content: content)
  Club.create!(name: name2, user_id: x, position: position2,
    start_time: Time.zone.today-10, current: true, content: content)
end
