require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
  	@restaurant = FactoryBot.create(:restaurant)
  end

  describe 'creation validations' do
  	it 'should require a name' do
  		@restaurant.name = ""
  		expect(@restaurant).to be_invalid
  	end

  	it 'should require a cusisine' do
  		@restaurant.cuisine = ""
  		expect(@restaurant).to be_invalid
  	end
  end
end
