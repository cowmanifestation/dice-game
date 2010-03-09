require "dice_set"
require "points"
require "player"
#maybe points.rb should be part of the GreedGame class and dice_set.rb should be part of the Player class


class GreedGame
  NoPlayersError = Class.new(StandardError)

  def initialize(*players)  
    raise NoPlayersError if players.empty?
    @players = players.map { |p| Player.new(p) }
  end

  attr_reader :players

  def player_names
    players.map {|p| p.name}
  end
  
  def player_scores
    players.map {|p| p.score}
  end
  
  def score(player, dice)
    if points(dice) == 0
      print "Your turn is over."
      switch_turns
    else
      player.score += points(dice)
    end
  end
  
  def roll
    
    player = players[0]
    dice = player.roll(5)
    if points(dice) == 0
      print "No points.  Your turn is over!"
      switch_turns
    else
      switch_turns
      print "#{player.name} rolls: "
      dice
    end
  end
  
  def whose_turn?
    players[0].name
  end
  
  private
  
  def switch_turns
    player = players.shift
    players.push(player)
  end
  
end


