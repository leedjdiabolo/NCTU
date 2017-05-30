class EventsController < ApplicationController

	def index
		@bb = Board.where(["date <= ?", Time.now.strftime("%Y-%m-%d")] )
	end

	def show
		@bb = Board.find(params[:id])
	end

end
