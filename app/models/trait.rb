class Trait < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :characters, through: :character_traits
	validates :name, presence: true
	validates :description, presence: true
	validates :datatype, presence: true

	def self.min_and_max_character_traits(trait_id)
		trait = Trait.find(trait_id)
		if trait.datatype == "integer" || trait.datatype == "Integer"
			max = trait.character_traits.order(stat: :desc).limit(1)
			min = trait.character_traits.order(stat: :asc).limit(1)
			"The #{trait.name} trait has a current high stat of #{max[0].stat} and a current low stat of #{min[0].stat}."
		else 
			"This trait is not an integer datatype and thus does not support this method."
		end
	end

	def min_and_max_character_trait
		Trait.min_and_max_character_traits(self.id)
	end
end
