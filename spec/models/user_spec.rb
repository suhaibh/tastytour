require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
  	@user = FactoryBot.create(:user)
  end

  describe "creation validations" do
  	it "should require first name" do
  		@user.first_name = ""
  		expect(@user).to be_invalid
  	end

  	it "should require last name" do
  		@user.last_name = ""
  		expect(@user).to be_invalid
  	end

  end
end
