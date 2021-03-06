class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_user
	helper_method :user_signed_in?


	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	rescue ActiveRecord::RecordNotFound
		nil
	end

	def user_signed_in?
		return true if current_user
	end


end
