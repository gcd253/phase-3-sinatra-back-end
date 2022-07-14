require 'rspotify'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/browse_playlists' do
    playlists = Playlist.all
    playlists.to_json
  end

  get '/user_playlists/:id' do
    playlists = User.find(params[:id]).playlists
    playlists.to_json
  end

  get '/playlist/:id' do
    songs_in_playlist = Playlist.find(params[:id]).songs
    songs_in_playlist.to_json
  end

  post '/playlist' do
    Playlist.create(name: params[:name], id: params[:id], rating: params[:rating], user_id: params[:user_id])
  end

  delete '/playlist/:id' do
    playlist = Playlist.find(params[:id])
    playlist.destroy
    playlist.to_json
  end

  post '/playlists/:id' do
    song = Song.create(name: params[:name], artist: params[:artist])

    playlist = Song.find(params[:id])
    
    Join.create(song_id: song.id, playlist_id: playlist.id)
  end



end
