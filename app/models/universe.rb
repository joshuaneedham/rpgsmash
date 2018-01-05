class Universe < ApplicationRecord
	has_many :characters
	has_many :attributes
	has_many :users, through: :universe_users
end
