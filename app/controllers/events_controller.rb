require 'digest/md5'

class EventsController < ApplicationController

	def index
		@bb = Board.where(["date <= ?", Time.now.strftime("%Y-%m-%d")] )
	end

	def show
		@bb = Board.find(params[:id])
	end

	def login
		if session[:verify] != "root"
			@user = User.new
		else
			redirect_to boss_index_path
		end
	end

	def verify
		if user_params[:user] != "root" || Digest::MD5.hexdigest(user_params[:password]) != "63a9f0ea7bb98050796b649e85481845" 
			flash[:error]="Login unsuccessful."
			redirect_to events_login_path
		else
			session[:verify]="root"
			redirect_to boss_index_path
		end 
	end

	def user_params
		params.require(:user).permit(:user, :password)
	end
end
