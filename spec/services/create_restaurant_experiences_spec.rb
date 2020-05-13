require "rails_helper"

RSpec.describe CreateRestaurantExperience do
	before do
		@user = FactoryBot.create(:user)
		@creator = CreateRestaurantExperience.new(restaurant_name: "Example", 
																							 restaurant_address: "ABC", restaurant_cuisine: "American",
																							 experience_rating: 1, experience_review: "ok",
																							 experience_date: Date.today, experience_price: 1, user: @user.id)
	end

	describe "initializaiton" do
		let(:creator_for_existing_restaurant) { CreateRestaurantExperience.new(restaurant_name: "Chez Example", 
																							 restaurant_address: "123 Fake Street", restaurant_cuisine: "French",
																							 experience_rating: 1, experience_review: "ok",
																							 experience_date: Date.today, experience_price: 1, user: @user.id)}

		it "should create a restaurant instance" do
			expect { @creator.save }.to change(Restaurant, :count).by(1)
		end

		it "should create a new dining experience instance" do
			expect { @creator.save }.to change(DiningExperience, :count).by(1)
		end

		it "should not create Restaurant if the same restaurant already exists in the db" do
			@existing_restaurant = FactoryBot.create(:restaurant)
			expect { creator_for_existing_restaurant.set_restaurant }.not_to change(Restaurant, :count)
		end

		it "should not create Restaurant if the DiningExperience is invalid" do
			@creator.experience_review = ""
			expect { @creator.save }.not_to change(Restaurant, :count)
		end

		# make sure Restaurant doesn't save if DiningExperience fails validation and vice versa
	end	
end