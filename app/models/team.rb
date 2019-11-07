class Team < ApplicationRecord
  has_many :players
  has_many :games

 

  validates :name, presence: true, length: { minimum: 1 }



end
