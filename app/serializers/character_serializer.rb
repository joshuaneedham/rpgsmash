class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :biography, :universe_id
  belongs_to :universe
end
