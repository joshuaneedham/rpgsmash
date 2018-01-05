class Character < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :traits, through: :character_traits
end