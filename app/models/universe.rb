class Universe < ApplicationRecord
	has_many :characters
	has_many :traits 
	has_many :users, through: :universe_users
	validates :title, uniqueness: true
end
