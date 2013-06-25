class AddScoreToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :score, :integer
  end
end
