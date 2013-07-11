require 'spec_helper'

feature 'user votes on playlist' do 
  before {
  	Playlist.create(title: "playlist title", link: "spotify:user:romy329:playlist:1RLvgipG8hOAj16rHKHMN2", score: '1')
		visit root_path
  }

	scenario 'user upvotes a playlist' do
		find(:xpath, "/html/body/div[2]/div[2]/div/div/li[1]/a/i").click
		expect(page).to have_css('.votes li a', 'style="opacity: 0.5;')
	end

	scenario 'user downvotes a playlist' do
		find(:xpath, "/html/body/div[2]/div[2]/div/div/li[2]/a/i").click
		expect(page).to have_css('.votes li a', 'style="opacity: 0.5;')
	end	
end