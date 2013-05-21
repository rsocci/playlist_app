class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(params[:comment])
		@comment.save
		if @comment.save
			redirect_to playlists_path, :notice => "Comment added successfully"
		else
			render 'new'
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		if @comment.update_attributes(params[:comment])
			redirect_to comments_path, :notice => "Comment has been updated"
		else
			render 'edit'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comments_path, :notice => "Comment has been deleted"
	end
end
