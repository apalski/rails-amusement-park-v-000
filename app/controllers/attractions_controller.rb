class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
		@user = current_user
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save
			redirect_to attraction_path(@attraction), alert: "New attraction"
		else
			render :index
		end		
	end

	def show
		set_attraction
		@user = current_user
	end

	def edit
		set_attraction
	end

	def update
		set_attraction
		if @attraction.update(attraction_params)
			redirect_to attraction_path(@attraction)
		else
			render :edit
		end		
	end

	private

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end

	def attraction_params
		params.require(:attraction).permit(:name, :tickets, :min_height, :nauseous_rating, :happiness_rating)
	end
end
