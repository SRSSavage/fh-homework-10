class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  validates :name, presence: true, length: { minimum: 1 }
  validates :away_team_id, presence: true, numericality: { only_integer: true }
  validates :home_team_id, presence: true, numericality: { only_integer: true }
end
