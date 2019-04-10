class SessionsController < ApplicationController
=begin
/***************************************************************************************
*    Title: Ruby on Rails Beginner's Tutorial 15-B Creating Sessions source code
*    Author: BarbieTechFabulous
*    Date: March 11th 2018
*    Code version: Unknown
*    Availability: https://www.youtube.com/watch?v=GHhg48w0Uag
*
***************************************************************************************/
=end 
  def index
    # when user signs in, automatically go to root_path which is the homepage
  	redirect_to root_path
  end

  def new
  end

  def create
    # when sessions starts, it looks for user id
  	user = User.find_by_userid(params[:userid])
    # however, password needs to be authenticated first
    # using a condition
    # if password is correct
  	if user && user.authenticate(params[:password])
      # start sessions
  		session[:user_id] = user.id
  		redirect_to root_path, notice:
  		"Welcome #{user.userid}, you have successfully signed in!"
  	else
      # else give an alert
  		render 'new', alert: 
  		"User ID and/or Password Invalid!"
  	end 
  end
  # method for ending sessions
  def destroy
    # when session is destroyed, it is empty
  	session[:user_id] = nil 
    # redirect to root_path which is the homepage
  	redirect_to root_path, notice:
  	"You have successfully logged out!"
  end  
end
