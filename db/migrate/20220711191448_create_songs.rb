class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :user_id
      t.integer :playlist_id
    end
  end
end
