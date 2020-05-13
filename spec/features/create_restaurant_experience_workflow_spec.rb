require "rails_helper"

RSpec.describe "adding a new restaurant and dining experience" do
	let(:user) { FactoryBot.create(:user) }

	before do
		login_as(user, scope: :user)
	end

	it "requires a user to be logged in to create a new experience" do
		logout(:user)
		visit new_create_restaurant_experience_path
		expect(current_path).to eq(new_user_session_path)
	end

	it "allows a signed in user to create a new experience through a form" do
		visit new_create_restaurant_experience_path

		fill_in "create_restaurant_experience[restaurant_name]", with: "New Restaurant"
		fill_in "create_restaurant_experience[restaurant_address]", with: "123 Somewhere Avenue"
		fill_in "create_restaurant_experience[restaurant_cuisine]", with: "American"
		fill_in "create_restaurant_experience[experience_rating]", with: 4
		fill_in "create_restaurant_experience[experience_review]", with: "Great time, great food"
		fill_in "create_restaurant_experience[experience_price]", with: "moderate"
		fill_in "create_restaurant_experience[experience_date]", with: Date.today
		click_button "Save"

		expect(page).to have_content("New Restaurant")
	end

	it "should display errors for an invalid restaurant submission" do
		visit new_create_restaurant_experience_path

		fill_in "create_restaurant_experience[restaurant_name]", with: ""
		fill_in "create_restaurant_experience[restaurant_address]", with: "123 Somewhere Avenue"
		fill_in "create_restaurant_experience[restaurant_cuisine]", with: "American"
		fill_in "create_restaurant_experience[experience_rating]", with: 10
		fill_in "create_restaurant_experience[experience_review]", with: "Great time, great food"
		fill_in "create_restaurant_experience[experience_price]", with: "moderate"
		fill_in "create_restaurant_experience[experience_date]", with: Date.today
		click_button "Save"

		expect(page).to have_selector('form')
	end

	# add test for invalid submission that renders errors, need to add errors to the create_restaurant_experiences.rb file
end