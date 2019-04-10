class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
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
	# needs to make signed in user available to all controllers
	private
	def current_user
		# conditional statement, only true if session is in session/successfully working
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	# make this method available to views folders
	helper_method :current_user
end
