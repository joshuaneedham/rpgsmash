class TraitSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :datatype, :universe_id
  belongs_to :universe
end
