class Trait < ApplicationRecord
	belongs_to :universe
	has_many :character_traits
	has_many :characters, through: :character_traits
	validates :name, presence: true
	validates :description, presence: true
	validates :datatype, presence: true
end
