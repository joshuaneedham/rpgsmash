class Attribute < ApplicationRecord
	belongs_to :universe
	has_many :characters, through: :attribute_characters
end
