class RemoveVotesFromPlaylist < ActiveRecord::Migration
  def up
    remove_column :playlists, :up_votes
    remove_column :playlists, :down_votes
  end

  def down
    add_column :playlists, :down_votes, :integer
    add_column :playlists, :up_votes, :integer
  end
end
