class PlaylistsController < ApplicationController
	before_filter :get_playlist, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def get_playlist
		@playlist = Playlist.find(params[:id])
	end

	def index
		@playlists = Playlist.all
	end


	def show
		
	end


	def new
		@playlist = Playlist.new
	end


	def create 
		@playlist = Playlist.new(params[:playlist])
		p_author = @playlist.link.scan(/user[:\/](.+)[\/:]playlist/)
		p_id = @playlist.link.scan(/[a-zA-Z0-9]{22}/)
		embedded_link = Playlist.create_embedded_link(p_author, p_id)
		if @playlist.save
			@playlist.update_attributes(:playlist_id => p_id, :link => embedded_link)
			redirect_to playlists_path, :notice => "New Playlist Added"
		else
			render 'new'
		end
	end


	def edit
		
	end


	def update
		if @playlist.update_attributes(params[:playlist])
			redirect_to playlists_path, :notice => "Playlist has been updated"
		else
			render 'edit'
		end
	end


	def destroy
		@playlist.destroy
		redirect_to playlists_path, :notice => "Playlist has been deleted"
	end

end
