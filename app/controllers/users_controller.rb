class UsersController < ApplicationController
	before_filter :get_user, only: [:show, :edit, :update, :destroy]

	def get_user
		@user = User.find(params[:id])
	end

	def index # has a view
		@users = User.all
	end

	def show # has a view
		
	end

	def new # has a view
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		@user.save # returns true/false

		if @user.save
			redirect_to users_path, :notice => "New user added successfully"
		else
			render "new"
		end
	end

	def edit # has a view
		
	end

	def update
		
	
		if @user.update_attributes(params[:user])
			redirect_to users_path, :notice => "User updated successfully"
		else
			render "edit"
		end
	end

	def destroy
		
		@user.destroy

		redirect_to users_path, :notice => "User has been deleted"
	end
end
