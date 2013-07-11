require 'spec_helper'

feature 'user creates new playlist' do
	scenario 'they see new playlist in list of playlists' do
		User.create(first_name: 'Romina', last_name: 'Vargas', email: 'rvargas@gmail.com', password: 'password')
		visit login_path
		fill_in 'Email', :with => 'rvargas@gmail.com'
		fill_in 'Password', :with => 'password'
		click_button ('Sign in')
		click_button('Create New Playlist')
		fill_in 'Title', :with => 'my playlist'
		fill_in	'Link', :with => 'spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2'
		click_button ('Create')
		expect(page).to have_css('.title', text: 'my playlist')
		expect(page).to have_content("New Playlist Added")
	end

	scenario 'user wants to see list of playlists' do
		Playlist.create(title: "playlist title", link: "spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2")
		visit root_path
		expect(page).to have_css('.title', text: 'playlist title')
	end

	scenario 'user wants to see the individual playlist' do
		user = User.create(first_name: 'Romina', last_name: 'Vargas', email: 'rvargas@gmail.com', password: 'password', id: '1')
		user.playlists.create(title: "playlist title", link: "spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2", id: '1')
		visit root_path
		click_link('playlist title')
		expect(page).to have_css('.page-header h1', text: 'playlist title')
		save_and_open_page
		expect(page).to have_content('spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2')
	end

	scenario 'playlists should be sorted in descending order according to vote score' do
		p1 = Playlist.create(title: "playlist 1", link: "spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2", score: 1)
		p2 = Playlist.create(title: "playlist 2", link: "spotify:user:romy329:playlist:0P2vXAgOY9v5NZrZPkSnSQ", score: 10)
		visit root_path
		page.body.index(p2.title).should < page.body.index(p1.title)
	end
end