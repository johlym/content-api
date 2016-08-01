class NodeSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :name, :data, :created_at, :updated_at
end
