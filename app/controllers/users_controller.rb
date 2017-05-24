class UsersController < ApplicationController

	def index
		
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.admin = true if params[:user][:admin] == '1'
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end		
	end

	def show
		if logged_in?
			set_user
		else
			redirect_to root_path
		end		
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets)
	end
end
