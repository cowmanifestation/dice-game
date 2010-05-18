class GreedPlayer

  def initialize
    @score = 0
    #@name = name
    @temp_score = 0
  end

  attr_reader :name
  attr_accessor :score, :temp_score

  def roll_score(dice)
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
 
  def roll_dice(dice, number_of_dice=5)
    dice_roll = dice.roll(number_of_dice)
    if roll_score(dice_roll) == 0
      p dice_roll
      #end_turn
    else
      return dice_roll
    end
  end

  def roll_again(dice, dice_to_roll_again = [])
    dice_to_roll_again.reverse.each do |die|
      dice.delete_at(die - 1)
    end
    @temp_score += roll_score(dice)
    roll_dice(dice, dice_to_roll_again.size)
  end
 

  def keep_points(dice)
    @score += roll_score(dice) + @temp_score
    end_turn
  end

  def end_turn
    "End of Turn!"
  end

  #I don't know if we can have a play_turn method here because there needs to be
  #player input for roll_again
=begin
  def play_turn(dice)
    dice_roll = roll_dice(dice)
    unless roll_dice == "End of Turn!"
      roll_again(dice_to_roll_again)
    end
  end
=end
end
