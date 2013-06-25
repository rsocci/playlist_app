class PlaylistsController < ApplicationController
	before_filter :get_playlist, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def get_playlist
		@playlist = Playlist.find(params[:id])
	end

	def index
		@playlists = Playlist.all
		respond_to do |format|
			format.html
			format.js
		end
	end


	def show
		@comments = Comment.where("playlist_id = ?", params[:id])
		if current_user
			@comment = current_user.comments.new
		end
	end


	def new
		@playlist = Playlist.new
	end


	def create 
		p_author = params[:playlist][:link].scan(/user[:\/](.+)[\/:]playlist/)
		p_id = params[:playlist][:link].scan(/[a-zA-Z0-9]{22}/)
		embedded_link = Playlist.create_embedded_link(p_author, p_id)
		args = params[:playlist].merge(:p_id => p_id, :link => embedded_link)
		@playlist = current_user.playlists.new(args)
		if @playlist.save
			redirect_to playlists_path, :notice => "New Playlist Added"
		else
			render 'new'
		end
	end


	def update
		if @playlist.update_attributes(params[:playlist])
			redirect_to playlists_path, :notice => "Playlist has been updated"
		else
			render 'edit'
		end
	end


	def destroy
		if current_user.id == @playlist.user_id
			@playlist.destroy
			redirect_to playlists_path, :notice => "Playlist has been deleted"
		else
			redirect_to playlists_path, :notice => "You do not have permission to delete this playlist"
		end
	end

	def vote
		playlist = Playlist.find(params[:id])
		redirect_to playlists_path
	end
end
