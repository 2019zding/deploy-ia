class UsersController < ApplicationController
	#actions for users
	def index 
	end
=begin
/***************************************************************************************
*    Title: Ruby on Rails 5 Beginner's Tutorial - 15-A Authorization and Sessions source code
*    Author: BarbieTechFabulous
*    Date: March 9th 2018
*    Code version: Unknown
*    Availability: https://www.youtube.com/watch?v=I7RCZ6f5l0g
*
***************************************************************************************/
=end 
	def new
		@user = User.new
	end

	def create
		# creating new user and passing in user params in paranthesis 
		@user = User.new(user_params)
		if @user.save
			# after user creates a new account, sessions will begin
			session[:user_id] = @user.id
			redirect_to admin_path, notice:
			"Welcome #{@user.userid}! You have successfully created an account."
		else
			render 'new'
		end
	end

	private
	def user_params
		#what the user_params require, what users must input when creating a new account
		params.require(:user).permit(:userid, :email, :password, :password_confirmation)
	end
end
