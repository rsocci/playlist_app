class AddColumnsToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :title, :string
    add_column :playlists, :playlist_id, :string
  end
end
