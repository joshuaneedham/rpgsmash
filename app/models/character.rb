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

	def construct_character_traits
		self.traits.each do |trait|
			trait.character_traits << CharacterTrait.create(:trait_id => trait.id, :character_id => self.id)
		end
	end

	def character_traits_attributes=(character_traits_attributes)
		character_traits_attributes.each do |i, character_trait_attributes|
			self.character_traits.update(character_trait_attributes)
		end
	end

end