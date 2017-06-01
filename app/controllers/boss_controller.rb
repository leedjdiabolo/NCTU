class BossController < ApplicationController

	before_action :check_root

	def check_root
		if session[:verify] != "root"
			redirect_to events_path
		end 
	end

	def index
		@bb = Board.all
	end

	def show
		@bb = Board.find(params[:id])
	end

	def new
		@bb = Board.new
	end

	def create
		@bb = Board.new(bb_params)
		@bb.save

		redirect_to boss_index_path
	end

	def edit
		@bb = Board.find(params[:id])
	end

	def update
		@bb = Board.find(params[:id])
		@bb.update(bb_params)

		redirect_to boss_path(@bb)
	end

	def destroy
		@bb = Board.find(params[:id])
		@bb.destroy
		redirect_to boss_index_path
	end

	def logout
		session[:verify]=nil
		redirect_to events_path
	end

	def bb_params
		params.require(:board).permit(:title, :content, :date)
	end
end
