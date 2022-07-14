class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :joins
    has_many :songs, through: :joins

    def change_name(id, name)
        self.where(id: id)
    end
end