class Trait < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :characters, through: :character_traits
end
