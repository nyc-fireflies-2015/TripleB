5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,username: Faker::Internet.user_name, email: Faker::Internet.free_email, phone: Faker::PhoneNumber.phone_number, password: "1234")
end

issues = ["worn brake pad","slipped chain","detached brake cable","punctured tube", "popped tire", "loose crankset","split fork"]

issues.each {|issue| Issue.create(part: issue)}

status = ["incomplete","in progress","complete"]

users = User.all

2.times do
  users[0].created_alerts.create(latitude: 40.672203,longitude: -73.989809,status: status[0])
end
2.times do
  alert = users[1].created_alerts.create(latitude: 40.681031,longitude: -73.974717,status: status[1])
  alert.mechanic = users[2]
end
2.times do
  alert = users[0].created_alerts.create(latitude: 40.689300,longitude: -73.957153,status: status[2])
  alert.mechanic = users[2]
end
2.times do
  users[3].created_alerts.create(latitude: 40.721215,longitude: -73.962044,status: status[0])
end
2.times do
  alert = users[4].created_alerts.create(latitude: 40.711171,longitude: -73.960916,status: status[1])
  alert.mechanic = users[1]
end
2.times do
  alert = users[4].created_alerts.create(latitude: 40.752761,longitude: -73.975263,status: status[2])
  alert.mechanic = users[0]
end