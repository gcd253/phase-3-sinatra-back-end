require 'pry'

class Join < ActiveRecord::Base
    belongs_to :song
    belongs_to :playlist

    def add_to_playlist(playlist_id, song_id)
        Join.create(playlist_id: playlist_id, song_id: song_id)
    end

    def remove_from_playlist(playlist_id, song_id)
        row = Join.where(playlist_id: playlist_id, song_id: song_id)
        binding.pry
        deleted = row[0]
        binding.pry
        deleted.destroy
    end
end