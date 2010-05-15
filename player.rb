class Player

  def initialize(name)
    @score = 0
    @name = name
  end

  attr_reader :name
  attr_accessor :score

end

=begin
class GreedPlayer << Player

  def initialize(name, dice)
    super
    @dice = dice
    @temp_score = 0
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
 
  def keep_points
    players.first.score += score(@dice) + @temp_score
    switch_turns
  end
 

end
=end
