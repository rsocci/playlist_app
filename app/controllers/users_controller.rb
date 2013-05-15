class UsersController < ApplicationController
	def index # has a view
		@users = User.all
	end

	def show # has a view
		@user = User.find(params[:id])
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
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	
		if @user.update_attributes(params[:user])
			redirect_to users_path, :notice => "User updated successfully"
		else
			render "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path, :notice => "User has been deleted"
	end
end
