class RenameColumn < ActiveRecord::Migration
  def up
  	rename_column :playlists, :playlist_id, :p_id
  end

  def down
  	rename_column :playlists, :p_id, :playlist_id
  end
end
