
class SessionsController < ApplicationController

	def create
		session[:username] = params[:name]
		@user = User.find_by(name: params[:name])
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def destroy
		session.clear
		redirect_to root_path
	end
end