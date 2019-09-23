class Player < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :email, presence: true, email: true
  validates :age, presence: true, inclusion: { in: 1..100 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_secure_password
  alias_method :authenticate, :valid_password?

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end



  def self.positions
    [
      'forward',
      'right back',
      'right midfielder',
      'defensive midfielder',
      'goalkeeper',
      'striker',
      'left midfielder',
      'defensive midfielder',
      'left back',
      'stopper',
      'sweeper'
    ]
  end

  validates :position, presence: true,
                       inclusion: { in: Player.positions,
                                    message: "%{value} is not a valid position" }
end
