class Join < ActiveRecord::Base
    belongs_to :song
    belongs_to :playlist

    # CREATE a new Join table row (add a song to the playlist of your choice)
    def add_to_playlist(playlist_id, song_id)
        Join.create(playlist_id: playlist_id, song_id: song_id)
    end

    # DELETE a row from the Join table (remove a song from the playlist of your choice)
    def remove_from_playlist(playlist_id, song_id)
        row = Join.where(playlist_id: playlist_id, song_id: song_id)
        deleted = row[0]
        deleted.destroy
    end
end