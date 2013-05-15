class PlaylistsController < ApplicationController

	def index
		@playlists = Playlist.all
	end


	def show
		@playlist = Playlist.find(params[:id])
	end


	def new
		@playlist = Playlist.new
	end


	def create
		@playlist = Playlist.new(params[:playlist])
		@playlist.save

		if @playlist.save
			redirect_to playlists_path, :notice => "New Playlist Added"
		else
			render 'new'
		end
	end


	def edit
		@playlist = Playlist.find(params[:id])
	end


	def update
		@playlist = Playlist.find(params[:id])
		if @playlist.update_attributes(params[:playlist])
			redirect_to playlists_path, :notice => "Playlist has been updated"
		else
			render 'edit'
		end
	end


	def destroy
		@playlist = Playlist.find(params[:id])
		@playlist.destroy
		redirect_to playlists_path, :notice => "Playlist has been deleted"
	end

end
