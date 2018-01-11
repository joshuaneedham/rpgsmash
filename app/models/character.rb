class Character < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :traits, through: :character_traits

	def construct_traits(universe_id)
		self.universe = Universe.find_by_id(universe_id)
		self.universe.traits.each do |trait|
			self.traits << trait
			trait.character_traits << CharacterTrait.create(:character_id => self.id, :trait_id => trait.id) 
		end
	end
end