class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :biography, :universe_id
  belongs_to :universe
  has_many :character_traits
  has_many :traits, through: :character_traits
end
