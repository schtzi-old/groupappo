require 'faker'

puts "Deleting old data"
User.destroy_all
Track.destroy_all
Gruppetto.destroy_all
Chatroom.destroy_all

puts "Creating users"
User.create(first_name: "Admin", last_name: "Admin", email: "admin@test.com", password: "Pass1234", zip_code: "300", country: "Australia")
User.create(first_name: "Shelley", last_name: "Timmins", email: "shelley.timmins@test.com", password: "Pass1234", zip_code: "3067", country: "Australia")
User.create(first_name: "Ryan", last_name: "Boyd", email: "ryan.boyd@test.com", password: "Pass1234", zip_code: "3000", country: "Australia")
User.create(first_name: "Jan", last_name: "Schuetz", email: "jan.schuetz@test.com", password: "Pass1234", zip_code: "3012", country: "Australia")
User.create(first_name: "Craig", last_name: "Simpson", email: "craig.simpson@test.com", password: "Pass1234", zip_code: "3042", country: "Australia")
User.create(first_name: "Tom", last_name: "Robshaw", email: "tom.robshaw@test.com", password: "Pass1234", zip_code: "3050", country: "Australia")
User.create(first_name: "Sammy", last_name: "Espinet", email: "sammy.espinet@test.com", password: "Pass1234", zip_code: "4027", country: "Australia")
User.create(first_name: "Talina", last_name: "Bayeleva", email: "talina.bayeleva@test.com", password: "Pass1234", zip_code: "3000", country: "Australia")
User.create(first_name: "Matthieu", last_name: "Minier", email: "matthieu.minier@test.com", password: "Pass1234", zip_code: "3000", country: "Australia")
User.create(first_name: "George", last_name: "Kettle", email: "george.kettle@test.com", password: "Pass1234", zip_code: "4000", country: "Australia")
User.create(first_name: "Anja", last_name: "Drayton", email: "anja.drayton@test.com", password: "Pass1234", zip_code: "3000", country: "Australia")

puts "Creating tracks"
Track.create(user_id: 2, name: "Ride Around the City", address: "43 Stewart St, Richmond", total_km: 15, total_vm: 5)
Track.create(user_id: 3, name: "Merri Creek Trail", address: "Flinders St, Melbourne", latitude: 37.7884, longitude: 144.9956, total_km: 50, total_vm: 20)
Track.create(user_id: 2, name: "Main Yarra Trail", address: "Yarra Bend Rd, Fairfield", latitude: 37.7920, longitude: 145.0072, total_km: 30, total_vm: 100)
Track.create(user_id: 4, name: "Great Victorian Rail Trail", address: "Merton, VIC", latitude: 36.9775, longitude: 145.7116, total_km: 120, total_vm: 300)
Track.create(user_id: 3, name: "Bay Trail", address: "Brighton, Vic", latitude: 37.9129, longitude: 144.9916, total_km: 50, total_vm: 2)
Track.create(user_id: 4, name: "Goldfields Track", address: "Wallaby Track, Buninyong, VIC", latitude: 37.6522, longitude: 143.8944, total_km: 70, total_vm: 60)

puts "Creating gruppettos with chatrooms"
grup1 = Gruppetto.create(name: "Christmas Ride around the City", track_id: 1, user_id: 2, start: DateTime.strptime("25/12/2022 12:00", "%d/%m/%Y %H:%M"),
                  description: "Ho ho ho, ride with Santa 🎅🏼", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Moderate", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 1)
Message.create(user_id: 2, chatroom_id: 1, content: " Welcome! #{grup1.name.capitalize} has been created by #{grup1.user.first_name.capitalize}.")

grup2 = Gruppetto.create(name: "Batch #1044 Ride for your life!", track_id: 4, user_id: 4, start: DateTime.strptime("10/12/2022 07:30", "%d/%m/%Y %H:%M"),
                  description: "Catch with all of your Le Wagon friends", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Hard", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 2)
Message.create(user_id: 4, chatroom_id: 2, content: " Welcome! #{grup2.name.capitalize} has been created by #{grup2.user.first_name.capitalize}.")

grup3 = Gruppetto.create(name: "Cycle and Chill", track_id: 5, user_id: 3, start: DateTime.strptime("11/12/2022 16:00", "%d/%m/%Y %H:%M"),
                  description: "Bit of cycling, bit of chilling on a Sunday arvo", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Easy", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 3)
Message.create(user_id: 3, chatroom_id: 3, content: " Welcome! #{grup3.name.capitalize} has been created by #{grup3.user.first_name.capitalize}.")

grup4 = Gruppetto.create(name: "Jan(aka yarn) Bike Race Black Diamond", track_id: 3, user_id: 4, start: DateTime.strptime("20/12/2022 06:00", "%d/%m/%Y %H:%M"),
                  description: "Yarning up that hill (and back down again a load of times)", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Hard", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 4)
Message.create(user_id: 4, chatroom_id: 4, content: " Welcome! #{grup4.name.capitalize} has been created by #{grup4.user.first_name.capitalize}.")

grup5 = Gruppetto.create(name: "Ryan's Ferrari Race", track_id: 2, user_id: 3, start: DateTime.strptime("01/01/2023 11:00", "%d/%m/%Y %H:%M"),
                  description: "It's a Caulfield road race, bring your own ferrari!", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Moderate", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 5)
Message.create(user_id: 3, chatroom_id: 5, content: " Welcome! #{grup5.name.capitalize} has been created by #{grup5.user.first_name.capitalize}.")

grup6 = Gruppetto.create(name: "Big Cycle Weekend in High Country", track_id: 4, user_id: 4, start: DateTime.strptime("17/12/2022 06:00", "%d/%m/%Y %H:%M"),
                  description: "Cycle the entire Great Vic Rail Trail over the weekend. Camping on Saturday night 🏕", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Hard", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 6)
Message.create(user_id: 4, chatroom_id: 6, content: " Welcome! #{grup6.name.capitalize} has been created by #{grup6.user.first_name.capitalize}.")

grup7 = Gruppetto.create(name: "Beginner Ride in Melbourne", track_id: 1, user_id: 2, start: DateTime.strptime("15/12/2022 11:00", "%d/%m/%Y %H:%M"),
                  description: "Just learned to ride your bike? Come meet us for an easy ride around the CDB 😎", gruppetto_status: "draft",
                  difficulty: "Easy", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 7)
Message.create(user_id: 2, chatroom_id: 7, content: " Welcome! #{grup7.name.capitalize} has been created by #{grup7.user.first_name.capitalize}.")

grup8 = Gruppetto.create(name: "End of Nov 🚴🏻‍♀️", track_id: 1, user_id: 2, start: DateTime.strptime("30/11/2022 11:00", "%d/%m/%Y %H:%M"),
                  description: "Finish November with a bang!", avg_speed: 20, gruppetto_status: "draft",
                  difficulty: "Hard", event_type: "Invite_only", participation_rule: "Manual")
Chatroom.create(gruppetto_id: 8)
Message.create(user_id: 2, chatroom_id: 8, content: " Welcome! #{grup8.name.capitalize} has been created by #{grup8.user.first_name.capitalize}.")


puts "Creating participations - gruppetto creators attending"
Participation.create(user_id: 2, gruppetto_id: 1, participation_status: 1)
Participation.create(user_id: 4, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 3, gruppetto_id: 3, participation_status: 1)
Participation.create(user_id: 4, gruppetto_id: 4, participation_status: 1)
Participation.create(user_id: 3, gruppetto_id: 5, participation_status: 1)
Participation.create(user_id: 4, gruppetto_id: 6, participation_status: 1)
Participation.create(user_id: 2, gruppetto_id: 7, participation_status: 1)

puts "Creating participations - gruppetto attendees"
Participation.create(user_id: 3, gruppetto_id: 1, participation_status: 0)
Participation.create(user_id: 4, gruppetto_id: 1, participation_status: 0)
Participation.create(user_id: 5, gruppetto_id: 1, participation_status: 0)
Participation.create(user_id: 6, gruppetto_id: 1, participation_status: 1)
Participation.create(user_id: 7, gruppetto_id: 1, participation_status: 1)
Participation.create(user_id: 8, gruppetto_id: 1, participation_status: 1)

Participation.create(user_id: 2, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 3, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 4, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 5, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 6, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 7, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 8, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 9, gruppetto_id: 2, participation_status: 1)
Participation.create(user_id: 10, gruppetto_id: 2, participation_status: 1)

Participation.create(user_id: 5, gruppetto_id: 3, participation_status: 0)
Participation.create(user_id: 6, gruppetto_id: 3, participation_status: 0)
Participation.create(user_id: 7, gruppetto_id: 3, participation_status: 1)

Participation.create(user_id: 2, gruppetto_id: 5, participation_status: 0)
Participation.create(user_id: 3, gruppetto_id: 5, participation_status: 0)
Participation.create(user_id: 8, gruppetto_id: 5, participation_status: 0)

Participation.create(user_id: 2, gruppetto_id: 6, participation_status: 1)
Participation.create(user_id: 3, gruppetto_id: 6, participation_status: 1)
Participation.create(user_id: 8, gruppetto_id: 6, participation_status: 0)
