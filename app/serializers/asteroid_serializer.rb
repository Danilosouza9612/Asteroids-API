class AsteroidSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at
end