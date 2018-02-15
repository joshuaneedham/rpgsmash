class CharacterTraitSerializer < ActiveModel::Serializer
  attributes :id, :character_id, :trait_id, :stat
  belongs_to :character 
  belongs_to :trait
end
