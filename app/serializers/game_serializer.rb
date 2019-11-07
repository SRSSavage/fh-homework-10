class GameSerializer < ActiveModel::Serializer
  attributes :name, :away_team, :home_team
  belongs_to :away_team 
  belongs_to :home_team 
end