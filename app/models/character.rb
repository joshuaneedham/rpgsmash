class Character < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :traits, through: :character_traits

	def construct_traits
		self.universe.traits.each do |trait|
			self.traits << trait 
		end
	end
end