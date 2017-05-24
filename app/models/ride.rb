class Ride < ActiveRecord::Base

	belongs_to :user
	belongs_to :attraction

	def take_ride
		@user = User.find_by(id: self.user_id)
		@ride = Attraction.find_by(id: self.attraction_id)

		if @ride.tickets > @user.tickets && @user.height < @ride.min_height
			return  "#{low_tickets} #{too_small}"
		elsif @ride.tickets > @user.tickets
			return low_tickets
		elsif @user.height < @ride.min_height
			return "Sorry. #{too_small}"
		else
			@user.tickets = @user.tickets - @ride.tickets
			@user.nausea = @user.nausea + @ride.nausea_rating
			@user.happiness = @user.happiness + @ride.happiness_rating	
			@user.save
			return "Thanks for riding the #{@ride.name}!"		
		end	
	end	

	def low_tickets
		"Sorry. You do not have enough tickets to ride the #{@ride.name}."
	end

	def too_small
		"You are not tall enough to ride the #{@ride.name}."
	end
end
