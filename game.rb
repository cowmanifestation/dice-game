require "dice_set"
require "greed_player"

class GreedGame
  NoPlayersError = Class.new(StandardError)


  def initialize(players = raise(NoPlayersError), dice = DiceSet.new)
    @dice = dice
    @players = players.map { |p| p = GreedPlayer.new }
    @last_player = players[-1]
  end

  def play
    unless players.each {|p| p.score < 5000 }
      players.each do |p|
        player.play_turn
      end
    end
  end

  attr_reader :players
  attr_accessor :dice
  attr_accessor :temp_score 
  
  # is there a way to use the variables to which player instances are assigned and capitalize them to create names?  
  #def player_names
  #  players.map {|p| p.name}
  #  
  #  do we need player names anyway?
  #
  #end
  
  def player_scores
    players.map {|p| p.score}
  end
 
  def current_player
    players.first.name
  end
 
  def end_of_game
    #everyone through @last_player gets one more turn. 
    #when @last_player gets end_of_turn message
    #end_of_game!
  end

  private
  
  def switch_turns
    @temp_score = 0
    players.push(players.shift)
  end
    
end


