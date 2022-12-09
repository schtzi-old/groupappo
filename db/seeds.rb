require 'faker'
require 'down'


avatar_pictures = {
  George: "https://res.cloudinary.com/droozakjm/image/upload/v1670546640/avatar_seed/George_ikr0ei.jpg",
  Brad: "https://res.cloudinary.com/droozakjm/image/upload/v1670546640/avatar_seed/Brad_xvvxhu.jpg",
  Jan: "https://res.cloudinary.com/droozakjm/image/upload/v1670546639/avatar_seed/Jan_svutkz.png",
  Anja: "https://res.cloudinary.com/droozakjm/image/upload/v1670546639/avatar_seed/Anja_ib5sma.jpg",
  Matthieu: "https://res.cloudinary.com/droozakjm/image/upload/v1670546639/avatar_seed/Matthieu_gfcdqr.jpg",
  Talina: "https://res.cloudinary.com/droozakjm/image/upload/v1670546639/avatar_seed/Talina_yjgxkl.jpg",
  Shelley: "https://res.cloudinary.com/droozakjm/image/upload/v1670546639/avatar_seed/Shelley_cgtwgz.jpg",
  Ryan: "https://res.cloudinary.com/droozakjm/image/upload/v1670546639/avatar_seed/Ryan_c9ngjo.jpg",
  Sammy: "https://res.cloudinary.com/droozakjm/image/upload/v1670546638/avatar_seed/Sammy_bdr0ma.jpg",
  Tom: "https://res.cloudinary.com/droozakjm/image/upload/v1670546638/avatar_seed/Tom_ots81y.jpg",
  Craig: "https://res.cloudinary.com/droozakjm/image/upload/v1670546638/avatar_seed/Craig_qk4uay.jpg",
  Admin: 'https://res.cloudinary.com/droozakjm/image/upload/v1670548136/avatar_seed/Admin_mlmiml.jpg'
}
puts "Deleting old data"
Message.destroy_all
Chatroom.destroy_all
Gruppetto.destroy_all
User.destroy_all

puts 'Downloading GPX'
gpx_files = [Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274843/gpx-files/2022-12-05_990200475_GPX_Download__Best_view_of_Melbourne_Dights_Falls_Runde_von_Canterbury_zgznul.gpx'),
Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200450_GPX_Download__BBQ_place_Outlook_Hill_Runde_von_Highett_mip9bi.gpx'),
Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200501_GPX_Download__Best_view_of_Melbourne_Down_hill_slalom_Runde_von_Merri_hpezac.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200551_GPX_Download__Outlook_Hill_Hawthorne_Velodrome_Runde_von_Canterbury_uryh97.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200626_GPX_Download__Hawthorne_Velodrome_Best_view_of_Melbourne_Runde_von_Toorak_yz83wk.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200530_GPX_Download__Hawthorne_Velodrome_Outlook_Hill_Runde_von_Auburn_hpcc0q.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200641_GPX_Download__Dights_Falls_Best_view_of_Melbourne_Runde_von_Victoria_Park_vtxf69.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200626_GPX_Download__Hawthorne_Velodrome_Best_view_of_Melbourne_Runde_von_Toorak_yz83wk.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200530_GPX_Download__Hawthorne_Velodrome_Outlook_Hill_Runde_von_Auburn_hpcc0q.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200641_GPX_Download__Dights_Falls_Best_view_of_Melbourne_Runde_von_Victoria_Park_vtxf69.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274842/gpx-files/2022-12-05_990200595_GPX_Download__Hawthorne_Velodrome_Brighton_Beach_wave_riders_Runde_von_Auburn_xwzf31.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274841/gpx-files/2022-12-05_990200575_GPX_Download__Bonds_Rd_climb_Down_hill_slalom_Runde_von_Jewell_upilrw.gpx'),
Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274840/gpx-files/2022-12-05_990200660_GPX_Download__Capital_city_trail_Un_passable_Runde_von_North_Melbourne_qaz7gl.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274841/gpx-files/2022-12-05_990200888_GPX_Download__Best_view_of_Melbourne_Dights_Falls_Runde_von_North_Richmond_ha9t5m.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274841/gpx-files/2022-12-05_990200853_GPX_Download__Hurstbridge_trail_Smith_Gully_Cafe_Runde_von_Diamond_Creek_e6quzk.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274840/gpx-files/2022-12-05_990200869_GPX_Download__Hawthorne_Velodrome_Best_view_of_Melbourne_Runde_von_Burnley_lazgo9.gpx'),
# Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274840/gpx-files/2022-12-05_990200752_GPX_Download__Outlook_Hill_Best_view_of_Melbourne_Runde_von_Flagstaff_lvj2al.gpx'),
Down.download('https://res.cloudinary.com/dyvocxltk/raw/upload/v1670274840/gpx-files/2022-12-05_990200675_GPX_Download__Bonds_Rd_climb_Hurstbridge_trail_Runde_von_Rosanna_mhlq5f.gpx')
]
tracks = gpx_files.map do |file|
  [file.original_filename.split('__')[1][0..-12].gsub('_', " "), file]
end

puts "Creating users"
user_data = [
              { first_name: "Admin", last_name: "Admin", email: "admin@test.com", password: "Pass1234", zip_code: "300", country: "Australia" },
              { first_name: "Shelley", last_name: "Timmins", email: "shelley.timmins@test.com", password: "Pass1234", zip_code: "3067", country: "Australia" },
              { first_name: "Ryan", last_name: "Boyd", email: "ryan.boyd@test.com", password: "Pass1234", zip_code: "3000", country: "Australia" },
              { first_name: "Jan", last_name: "Schuetz", email: "jan.schuetz@test.com", password: "Pass1234", zip_code: "3012", country: "Australia" },
              { first_name: "Craig", last_name: "Simpson", email: "craig.simpson@test.com", password: "Pass1234", zip_code: "3042", country: "Australia" },
              { first_name: "Tom", last_name: "Robshaw", email: "tom.robshaw@test.com", password: "Pass1234", zip_code: "3050", country: "Australia" },
              { first_name: "Sammy", last_name: "Espinet", email: "sammy.espinet@test.com", password: "Pass1234", zip_code: "4027", country: "Australia" },
              { first_name: "Talina", last_name: "Bayeleva", email: "talina.bayeleva@test.com", password: "Pass1234", zip_code: "3000", country: "Australia" },
              { first_name: "Matthieu", last_name: "Minier", email: "matthieu.minier@test.com", password: "Pass1234", zip_code: "3000", country: "Australia" },
              { first_name: "George", last_name: "Kettle", email: "george.kettle@test.com", password: "Pass1234", zip_code: "4000", country: "Australia" },
              { first_name: "Anja", last_name: "Drayton", email: "anja.drayton@test.com", password: "Pass1234", zip_code: "3000", country: "Australia "}
            ]

user_data.each do |info|
  user = User.new(info)
  pic = Down.download(avatar_pictures[(user.first_name).to_sym])
  user.avatar.attach(io: pic, filename: "pic", content_type: "image/jpeg")
  user.save
end

# puts "Creating tracks"
# tracks.each do |track_info|
#   track = Track.create(user: User.all.sample, name: track_info[0])
#   track.file.attach(io: track_info[1], filename: track_info[1].original_filename, content_type: 'application/xml')
# end

puts "Creating gruppettos"

user = User.find_by(first_name: "Ryan")
track = Track.create(user: user, name: tracks[0][0])
track.file.attach(io: tracks[0][1], filename: tracks[0][1].original_filename, content_type: 'application/xml')
grup = Gruppetto.create(name: "Ryan's Ferrari Bike Race", track: track, user: user, start: DateTime.strptime("12/12/2022 11:00", "%d/%m/%Y %H:%M"),
                  description: "Want to see my Ferrari? Here is your chance! My bike is a 1 of 1 Ferrari, says the sticker I put on the side of it. It's a road race.", gruppetto_status: 'upcoming',
                  difficulty: "Easy", event_type: "Open", participation_rule: "Manual", avg_speed: 20)
Participation.create(user: user, gruppetto: grup, participation_status: 1)

user = User.find_by(first_name: "Jan")
track = Track.create(user: user, name: tracks[1][0])
track.file.attach(io: tracks[1][1], filename: tracks[1][1].original_filename, content_type: 'application/xml')
grup = Gruppetto.create(name: "Feierabendrunde mit Marc", track: track, user: user, start: DateTime.strptime("18/12/2022 12:00", "%d/%m/%Y %H:%M"),
                  description: "Jan's coastal trail - better be fast or you'll be last!", gruppetto_status: 'upcoming',
                  difficulty: "Moderate", event_type: "Open", participation_rule: "Manual", avg_speed: 45)
Participation.create(user: user, gruppetto: grup, participation_status: 1)

user = User.find_by(first_name: "Talina")
track = Track.create(user: user, name: tracks[2][0])
track.file.attach(io: tracks[2][1], filename: tracks[2][1].original_filename, content_type: 'application/xml')
grup = Gruppetto.create(name: "Batch #1044 Ride for your life!", track: track, user: user, start: DateTime.strptime("20/12/2022 07:30", "%d/%m/%Y %H:%M"),
                  description: "Talina misses all of her Le Wagon friends already! Come catch up with everyone, and let's ride our 🚲 ", gruppetto_status: 'upcoming',
                  difficulty: "Hard", event_type: "Open", participation_rule: "Manual", avg_speed: 30)
Participation.create(user: user, gruppetto: grup, participation_status: 1)

user = User.all.sample
track = Track.create(user: user, name: tracks[3][0])
track.file.attach(io: tracks[3][1], filename: tracks[3][1].original_filename, content_type: 'application/xml')
grup = Gruppetto.create(name: "Beginner Ride along the Yarra River - Dights Falls", track: track, user: user, start: DateTime.strptime("10/01/2023 12:00", "%d/%m/%Y %H:%M"),
                  description: "Just learned to ride your bike? Come meet us for an easy ride along the river! ", gruppetto_status: 'upcoming',
                  difficulty: "Easy", event_type: "Open", participation_rule: "Manual", avg_speed: 15)
Participation.create(user: user, gruppetto: grup, participation_status: 1)

user = User.all.sample
track = Track.create(user: user, name: tracks[4][0])
track.file.attach(io: tracks[4][1], filename: tracks[4][1].original_filename, content_type: 'application/xml')
grup = Gruppetto.create(name: "End of the Year NYE Party & Cycle! 🚴🏻‍♀️", track: track, user: user, start: DateTime.strptime("31/12/2022 13:00", "%d/%m/%Y %H:%M"),
                  description: "Finish 2022 with a bang!", gruppetto_status: 'upcoming',
                  difficulty: "Hard", event_type: "Open", participation_rule: "Manual", avg_speed: 35)
Participation.create(user: user, gruppetto: grup, participation_status: 1)

puts "Creating participations"

Gruppetto.all.each do |grup|
  (0..6).to_a.sample.times do
    Participation.create(user: User.all.filter { |u| u != grup.user }.sample, gruppetto: grup, participation_status: 0)
    Participation.create(user: User.all.filter { |u| u != grup.user }.sample, gruppetto: grup, participation_status: 1)
  end
end
