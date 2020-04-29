require 'rails_helper'

RSpec.describe DiningExperience, type: :model do
  before do
  	@dining_experience = FactoryBot.create(:dining_experience)
  end

  describe 'creation validations' do
  	it "should require date" do
  		@dining_experience.date = ""
  		expect(@dining_experience).to be_invalid
  	end

  	it "should require review" do
  		@dining_experience.review = ""
  		expect(@dining_experience).to be_invalid
  	end

  	it "should require rating" do
  		@dining_experience.rating = ""
  		expect(@dining_experience).to be_invalid
  	end

  	it "should require rating to be between 1 and 3" do
  		@dining_experience.rating = 6
  		expect(@dining_experience).to be_invalid
  	end

  end
end
