require 'rspotify'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # READ all Playlist instances
  get '/browse_playlists' do
    playlists = Playlist.all
    playlists.to_json
  end

  # READ specific Playlist instances
  get '/user_playlists/:id' do
    playlists = User.find(params[:id]).playlists
    playlists.to_json
  end

  # READ songs within a Playlist instance
  get '/playlist/:id' do
    songs_in_playlist = Playlist.find(params[:id]).songs
    songs_in_playlist.to_json
  end

  # CREATE a new Playlist instance
  post '/playlist' do
    playlist = Playlist.create(name: params[:name], id: params[:id], rating: params[:rating], user_id: params[:user_id])
    playlist.to_json
  end

  # DELETE a Playlist instance
  delete '/playlist/:id' do
    playlist = Playlist.find(params[:id])
    playlist.destroy
    playlist.to_json
  end

  # UPDATE the name of a Playlist instance
  patch '/playlist/:id' do
    playlist = Playlist.find(params[:id])
    playlist.update(name: params[:name])
    playlist.to_json
  end

  # CREATE a new User instance
  post '/new_user' do
    new_user = User.create(email: params[:email], password: params[:password])
    new_user.to_json
  end

# UPDATE email and password of a User instance
  patch '/user/:id' do
    user = User.find(params[:id])
    user.update(email: params[:email], password: params[:password])
    user.to_json
  end

  # CREATE a new Join table row (add a song to the playlist of your choice)
  post '/songs' do
    new_song = Join.create(playlist_id: params[:playlist_id], song_id: params[:song_id])
    new_song.to_json
  end

  # DELETE a row from the Join table (remove a song from the playlist of your choice)
  delete '/songs/:id' do
    delete_song = Join.find(params[:id])
    delete_song.destroy
    delete_song.to_json
  end

end