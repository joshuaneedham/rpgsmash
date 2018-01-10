class Character < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :traits, through: :character_traits

	def construct_traits(universe_id)
		self.universe = Universe.find_by_id(universe_id)
		self.universe.traits.each do |trait|
			self.traits << trait 
		end
	end
end