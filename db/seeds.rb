u1 = User.create(first_name: "John", last_name: "Doe" ,username: "mrdoe", email: "a@gmail.com", phone: "111-222-3333", password: "1234")
u2 = User.create(first_name: "Jane", last_name: "Doe" ,username: "mrsdoe", email: "b@gmail.com", phone: "222-333-4444" , password: "1234")
u3 = User.create(first_name: "Anaximander", last_name: "of Ionia" ,username: "philo123" , email: "c@gmail.com", phone: "333-444-5555" , password: "1234")
u4 = User.create(first_name: "Artaxerxes", last_name: "of Persia" ,username: "Rex01", email:"d@gmail.com" , phone: "444-555-6666", password: "1234")
u5 = User.create(first_name: "Romulus", last_name: "de Roma",username: "roma4lyfe" , email: "e@gmail.com", phone: "555-666-7777", password: "1234")

tags = ["brake pad","chain","brake cable","tube", "tire", "crankset","fork"]

tag_obj = tags.each {|tag| Tag.create(name: tag)}

status = ["incomplete","in progress","complete"]

users = User.all


alert1 = users[0].created_alerts.create(latitude: 40.672203,longitude: -73.989809,status: status[0], description: "brake pads are balding")
alert1.alert_tags.create(tag_id: 1)
alert1.save

alert2 = users[1].created_alerts.create(latitude: 40.681031,longitude: -73.974717,status: status[1], description: "my chain slipped off idk what to do")
alert2.mechanic = users[2]
alert2.alert_tags.create(tag_id: 2)
alert2.save

alert3 = users[0].created_alerts.create(latitude: 40.689300,longitude: -73.957153,status: status[0],description: "busted brake cable, can't stop!")
alert3.mechanic = users[2]
alert3.alert_tags.create(tag_id: 3)
alert3.save

alert4 = users[3].created_alerts.create(latitude: 40.721215,longitude: -73.962044,status: status[0],description: "rode over a rock, need an extra tube")
alert4.alert_tags.create(tag_id: 5)
alert4.save

alert5 = users[4].created_alerts.create(latitude: 40.711171,longitude: -73.960916,status: status[0], description: "rode through a tack convention and now my tire is flat :(")
alert5.mechanic = users[5]
alert5.alert_tags.create(tag_id: 5)
alert5.save

alert6 = users[4].created_alerts.create(latitude: 40.752761,longitude: -73.975263,status: status[2], description: "my bike split in half where is the nearest repair shop!??")
alert6.mechanic = users[6]
alert6.alert_tags.create(tag_id: 5)
alert6.save
