class CreateRestaurantExperience
	include ActiveModel::Model
	attr_accessor :restaurant_name, :restaurant_address, :restaurant_cuisine, 
								:experience_rating, :experience_review, :experience_price, :experience_date, :user

	def save
		ActiveRecord::Base.transaction do
			set_restaurant

			@dining_experience = save_dining_experience
			add_errors(@dining_experience.errors) if @dining_experience.invalid?
			@dining_experience.save!
		end
		rescue ActiveRecord::RecordInvalid => exception
			return false
	end

	def set_restaurant
		@restaurant = check_existing_restaurant || create_new_restaurant
	end

	def check_existing_restaurant
		Restaurant.find_by(name: restaurant_name, address: restaurant_address) 
	end

	def create_new_restaurant
		restaurant = Restaurant.create(name: restaurant_name, address: restaurant_address, cuisine: restaurant_cuisine)
		add_errors(restaurant.errors) if restaurant.invalid?
		restaurant.save!
		restaurant
	end

	def save_dining_experience
		@dining_experience = DiningExperience.create(rating: experience_rating, review: experience_review, 
																									price: experience_price, date: experience_date, 
																									restaurant_id: @restaurant.id, user_id: user)
	
	end

	private
		def add_errors(model_errors)
			model_errors.each do |attribute, message|
				errors.add(attribute, message)
			end
		end
end