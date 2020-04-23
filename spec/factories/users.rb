FactoryBot.define do
	factory :user do
		first_name 						{ "Luke" }
		last_name 						{ "Skywalker" }
		email 								{ "luke@example.com" }
		password							{ "password" }
		password_confirmation { "password" }
	end
end