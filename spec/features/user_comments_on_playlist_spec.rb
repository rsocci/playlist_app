require 'spec_helper'

feature 'user comments on playlist' do
	scenario 'user sees comment for playlist commented' do
		user = User.create(first_name: 'Romina', last_name: 'Vargas', email: 'rvargas@gmail.com', password: 'password')
		user.playlists.create(title: "playlist title", link: "spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2", id: '1')
		visit login_path		
		fill_in 'Email', :with => 'rvargas@gmail.com'
		fill_in 'Password', :with => 'password'
		click_button ('Sign in')
		visit root_path
		click_link('playlist title')
		fill_in 'comment_area', :with => 'this is a comment'
		click_button('Submit')
		expect(page).to have_css('.comment', text: 'this is a comment')
		expect(page).to have_content('Comment added successfully')
	end
end