require 'spec_helper'

feature 'playlists controller' do
  before {
  		User.create(first_name: 'Romina', last_name: 'Vargas', email: 'rvargas@gmail.com', password: 'password')
			visit login_path
			fill_in 'Email', :with => 'rvargas@gmail.com'
			fill_in 'Password', :with => 'password'
			click_button ('Sign in')
			click_button('Create New Playlist')
			fill_in 'Title', :with => 'my playlist'
  }
  	
	scenario 'POST create action embeds link using type 1 link' do
		save_and_open_page
		fill_in	'Link', :with => 'spotify:user:romy329:playlist:1rlvgipg8hoaj16rhkhmn2'
		click_button ('Create')
		link = Playlist.find(1).link
		expect(link).to eq('<iframe src="https://embed.spotify.com/?uri=spotify:user:romy329:playlist:1rlvgipg8hoaj16rhkhmn2" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>')
	end

	scenario 'post create action embeds link using type 2 link' do
		fill_in	'Link', :with => 'http://open.spotify.com/user/romy329/playlist/1rlvgipg8hoaj16rhkhmn2'
		click_button ('Create')
		link = Playlist.find(1).link
		expect(link).to eq('<iframe src="https://embed.spotify.com/?uri=spotify:user:romy329:playlist:1rlvgipg8hoaj16rhkhmn2" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>')
	end

	scenario 'post create action embeds link using type 3 link' do
		fill_in	'Link', :with => '<iframe src="https://embed.spotify.com/?uri=spotify:user:romy329:playlist:1rlvgipg8hoaj16rhkhmn2" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>'
		click_button ('Create')
		link = Playlist.find(1).link
		expect(link).to eq('<iframe src="https://embed.spotify.com/?uri=spotify:user:romy329:playlist:1rlvgipg8hoaj16rhkhmn2" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>')
	end
end