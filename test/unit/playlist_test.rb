require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  test "user should enter a title" do
  	playlist = Playlist.new
  	assert !playlist.save
  	assert !playlist.errors[:title].empty?
  end

   test "user should enter a link" do
  	playlist = Playlist.new
  	assert !playlist.save
  	assert !playlist.errors[:link].empty?
  end
end
