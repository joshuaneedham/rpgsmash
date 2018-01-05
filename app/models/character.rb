class Character < ApplicationRecord
	belongs_to :universe
	has_many :attributes, through: :attribute_characters
end
