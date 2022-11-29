require 'faker'

# User.destroy_all
# Track.destroy_all
# Gruppetto.destroy_all

User.create(first_name: 'Shelley', last_name: "Timmins", email: "shelley.timmins@test.com", password: "Pass1234", zip_code: "3067", country: "Australia")
User.create(first_name: 'Ryan', last_name: "Boyd", email: "ryan.boyd@test.com", password: "Pass1234", zip_code: "3000", country: "Australia")
User.create(first_name: 'Jan', last_name: "Schuetz", email: "jan.schuetz@test.com", password: "Pass1234", zip_code: "3012", country: "Australia")

Track.create(user_id: 1, name: "Tester Track - Inspire 9", address: "43 Stewart St, Richmond", latitude: "-37.8239428", longitude: "144.9890556")
Track.create(user_id: 2, name: "Tester Track - Train Station", address: "Flinders St, Melbourne", latitude: "-37.8184147", longitude: "144.9725892")
Track.create(user_id: 3, name: "Tester Track - Yarra Bend", address: "Yarra Bend Rd, Fairfield", latitude: "-37.7920409", longitude: "145.0072037")

Gruppetto.create(name: "Bike Race 1", track_id: 1, user_id: 1, start: Time.now + 5,
                 description: "Cycle for our lives", gruppetto_status: "draft",
                 difficulty: "novice", event_type: "invite_only", participation_rule: "manual",)
Gruppetto.create(name: "Bike Race 2", track_id: 2, user_id: 2, start: Time.now + 10,
                 description: "Lets do it", gruppetto_status: "draft",
                 difficulty: "hard", event_type: "invite_only", participation_rule: "manual",)
Gruppetto.create(name: "Bike Race 2", track_id: 3, user_id: 3, start: Time.now + 3,
                 description: "Cycle and chill", gruppetto_status: "draft",
                 difficulty: "moderate", event_type: "invite_only", participation_rule: "manual",)
