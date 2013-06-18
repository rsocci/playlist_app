class CommentsController < ApplicationController
	before_filter :get_comment, only: [:show, :edit, :destroy]
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def get_comment
		@comment = Comment.find(params[:id])
	end

	def index
		@comments = Comment.all
	end

	def show

	end

	def new		
		@playlist = Playlist.find(params[:playlist_id])
		@comment = current_user.comments.new
	end

	def create
		args = params[:comment].merge :playlist_id => params[:playlist_id]
		@comment = current_user.comments.new(args)
		if @comment.save
			redirect_to playlist_path(params[:playlist_id]), :notice => "Comment added successfully"
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@comment.destroy
		redirect_to playlists_path, :notice => "Comment has been deleted"
	end
end
