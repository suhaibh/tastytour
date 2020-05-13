class CreateRestaurantExperiencesController < ApplicationController
	before_action :authenticate_user!

	def new
		@create_restaurant_experience = CreateRestaurantExperience.new
	end

	def create
		@create_restaurant_experience = CreateRestaurantExperience.new(create_restaurant_experience_params)
		if @create_restaurant_experience.save
			# need to find a cleaner way to refactor, potentially saving the new instance of DiningExperience as an attr of the newly saved CreateRestaurantExperience
			redirect_to dining_experience_path(current_user.dining_experiences.last.id)
		else
			render :new
		end
	end

	private
		def create_restaurant_experience_params
			params.require(:create_restaurant_experience).permit(:restaurant_name, :restaurant_address, :restaurant_cuisine, 
								:experience_rating, :experience_review, :experience_price, :experience_date, :user)
		end
end