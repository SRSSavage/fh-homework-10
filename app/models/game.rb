class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: :"away_team_id"
  belongs_to :away_team, class_name: 'Team', foreign_key: :"away_team_id"

  validates :name, presence: true, length: { minimum: 1 }
  validates :away_team_id, presence: true, numericality: { only_integer: true }
  validates :home_team_id, presence: true, numericality: { only_integer: true }
end
