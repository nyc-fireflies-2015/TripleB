5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,username: Faker::Internet.user_name, email: Faker::Internet.free_email, phone: "9542950857", password: "1234")
end

status = ["in progress","complete"]

users = User.all


alert1 = users[0].alerts.create(description: "brake pads are balding")
location1 = alert1.create_location(latitude: 40.70637,longitude: -74.0091672)
alert1.update_attributes(location_id: location1.id)
users[0].update_attributes(location_id: location1.id)

alert2 = users[1].alerts.create(description: "brake pads are balding")
location2 = alert2.create_location(latitude: 40.70637,longitude: -74.0091674)
alert2.update_attributes(location_id: location2.id)
users[1].update_attributes(location_id: location2.id)

alert3 = users[2].alerts.create(description: "brake pads are balding")
location3 = alert3.create_location(latitude: 40.70637,longitude: -74.0091672)
alert3.update_attributes(location_id: location3.id)
users[2].update_attributes(location_id: location3.id)

alert4 = users[3].alerts.create(description: "brake pads are balding")
location4 = alert4.create_location(latitude: 40.70637,longitude: -74.0091671)
alert4.update_attributes(location_id: location4.id)
users[3].update_attributes(location_id: location4.id)

alert5 = users[4].alerts.create(description: "brake pads are balding")
location5 = alert5.create_location(latitude: 10.70637,longitude: -74.0091675)
alert5.update_attributes(location_id: location5.id)
users[4].update_attributes(location_id: location5.id)
