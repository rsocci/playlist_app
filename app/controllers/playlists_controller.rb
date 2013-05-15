class PlaylistsController < ApplicationController
	before_filter :get_playlist, only: [:show, :edit, :update, :destroy]

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
		@playlist.save

		if @playlist.save
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
