class Restaurant < ApplicationRecord
	validates :name, presence: true
	validates :cuisine, presence: true

	has_many :dining_experiences
end
