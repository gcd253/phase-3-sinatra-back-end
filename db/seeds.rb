require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here
5.times do 
    User.create(
        email: Faker::Internet.email, 
        password: Faker::Internet.password
    )
end

100.times do
    Song.create(
        name: Faker::Music::RockBand.song, 
        artist: Faker::Music::RockBand.name
    )
end

20.times do
    Playlist.create(
        name: Faker::Verb.base, 
        rating: rand(1..10), 
        user_id: User.ids.sample
    )
end

30.times do
    Join.create(
        song_id: Song.ids.sample, 
        playlist_id: Playlist.ids.sample
    )
end




puts "✅ Done seeding!"

User
Song
Playlist
Join
