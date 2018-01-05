class Trait < ApplicationRecord
	belongs_to :universe
	has_many :characters, through: :character_traits
end
