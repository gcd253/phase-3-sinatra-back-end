class CreateJoins < ActiveRecord::Migration[6.1]
  def change
    create_table :joins do |t|
      t.integer :song_id
      t.integer :playlist_id
    end
  end
end
