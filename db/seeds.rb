5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,username: Faker::Internet.user_name, email: Faker::Internet.free_email, phone: Faker::PhoneNumber.phone_number, password: "1234")
end

issues = ["worn brake pad","slipped chain","detached brake cable","punctured tube", "popped tire", "loose crankset","split fork"]

issues.each {|issue| Issue.create(part: issue)}