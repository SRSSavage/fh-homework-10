class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :players
  has_many :games


end