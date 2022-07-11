class Song < ActiveRecord::Base
    has_many :joins
    has_many :playlists, through: :joins
end