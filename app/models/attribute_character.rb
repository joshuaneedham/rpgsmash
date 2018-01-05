class AttributeCharacter < ApplicationRecord
	belongs_to :character 
	belongs_to :attribute 
end
