class Game < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }
  validates :away_team_id,  presence: true, numericality: { other_than: 0 }
  validates :home_team_id, presence: true, numericality: { other_than: 0}

  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
end
