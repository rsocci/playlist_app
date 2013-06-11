class AddVotesToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :up_votes, :integer, :null => false, :default => 0
    add_column :playlists, :down_votes, :integer, :null => false, :default => 0
  end
end
