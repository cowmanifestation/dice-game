require "dice_set"
require "greed_player"

class GreedGame
  NoPlayersError = Class.new(StandardError)


  def initialize(players = raise(NoPlayersError), dice = DiceSet.new)
    @dice = dice
    @temp_score = 0
    @players = players.map { |p| GreedPlayer.new(p) }
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
  
  
  def player_names
    players.map {|p| p.name}
  end
  
  def player_scores
    players.map {|p| p.score}
  end
=begin  
  def score(dice)
    n = 0
    (1..9).each do |i|
      amount = dice.find_all{|d| d == i}.size
      case i
      when 1
        if amount > 2
          n += 1000 + (amount - 3) * 100
        else
          n += amount * 100
        end
      when 5
        if amount > 2
          n += 500 + (amount - 3) * 50
        else
          n += amount * 50
        end
      else
        if amount > 2
          n += i * 100
        end
      end
    end

    return n
  end

  def roll(n = 5)
    result = @dice.roll(n)
    if score(result) == 0
      p result
      switch_turns
    else
      return result
    end
  end
 


  def roll_again(dice = [])
    dice.reverse.each do |die|
      @dice.delete_at(die - 1)
    end
    @temp_score += score(@dice)
    self.roll(dice.size)
  end
=end  
  def current_player
    players.first.name
  end
=begin  
  def keep_points
    players.first.score += score(@dice) + @temp_score
    if players.first.score >= 5000
      "#{players.first} Wins!"
      # end_of_game 
    else
      switch_turns
    end
  end
=end  
  def end_of_game
    #everyone through @last_player gets one more turn. 
  end

  private
  
  def switch_turns
    @temp_score = 0
    players.push(players.shift)
  end
    
end


