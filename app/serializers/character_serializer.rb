class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :biography, :universe_id
end
