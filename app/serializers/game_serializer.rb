class GameSerializer < ActiveModel::Serializer
  attributes :name, :away_team_id, :home_team_id
end