class Player
  include Mongoid::Document
  field :active, :type => Boolean
  field :frags, :type => Integer
  field :deaths, :type => Integer
  field :status

  embeds_many :games

  scope :active, where(:active => true) do
    def count
      size
    end
  end
  scope :inactive, :where => { :active => false }
  scope :frags_over, lambda { |count| { :where => { :frags.gt => count } } }
  scope :deaths_under, lambda { |count| where(:deaths.lt => count) }

  class << self
    def alive
      where(:status => "Alive")
    end
  end
end

class Game
  include Mongoid::Document
  field :saved, :type => Boolean, :default => false
  field :level, :type => Integer, :default => 1
  field :studio
  embedded_in :player, :inverse_of => :games

  scope :saved, where(:saved => true)

  class << self
    def blizzard
      where(:studio => "Blizzard")
    end
  end
end

Player.active # Returns active players.
Player.active.count # Returns the count of active players.
Player.active.alive # Returns active players that are alive.
Player.inactive.frags_over(10) # Returns inactive players with over 10 frags.
Player.deaths_under(30) # Returns players with under 30 deaths.

player = Player.find(id)
player.games.saved # Returns the players saved games
player.games.saved.blizzard # Returns the players saved Blizzard games
