5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,username: Faker::Internet.user_name, email: Faker::Internet.free_email, phone: "9542950857", password: "1234")
end

status = ["in progress","complete"]

users = User.all


alert1 = users[0].alerts.create(description: "brake pads are balding")
location1 = alert1.create_location(latitude: 50.672203,longitude: -73.989809)
alert1.update_attributes(location_id: location1.id)

alert2 = users[0].alerts.create(description: "brake pads are balding")
location2 = alert1.create_location(latitude: 51.672203,longitude: -72.989809)
alert2.update_attributes(location_id: location2.id)

alert3 = users[0].alerts.create(description: "brake pads are balding")
location3 = alert1.create_location(latitude: 50.72203,longitude: -71.989809)
alert3.update_attributes(location_id: location3.id)

alert4 = users[0].alerts.create(description: "brake pads are balding")
location4 = alert1.create_location(latitude: 50.72203,longitude: -73.989809)
alert4.update_attributes(location_id: location4.id)

alert5 = users[0].alerts.create(description: "brake pads are balding")
location5 = alert1.create_location(latitude: 10.672203,longitude: -73.989809)
alert5.update_attributes(location_id: location5.id)
