
require "dice_set"


class Player

  def initialize(name)
    @score = 0
    @dice = DiceSet.new
    @name = name
  end

  attr_reader :name
  attr_accessor :score

  def roll(n)
    @dice.roll(n).each {|d| print " #{d} "}
  end

end

