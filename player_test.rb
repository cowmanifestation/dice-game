require "player"
require "test/unit"

class PlayerTest < Test::Unit::TestCase
  def test_can_roll_dice
    p = Player.new("Pete")
    dice_roll = p.roll(15)
    assert_not_nil dice_roll
    assert_equal dice_roll.class, Array
  end

  def test_player_has_numerical_score
    p = Player.new("Pete")
    score = p.score
    assert_equal score.class, Fixnum
  end
  
  def test_score_can_be_added_to
    d = Player.new("Dude")
    dice_roll = d.roll(15)
    dice_roll.each {|r| d.score += r }
    assert d.score > 0
  end
  
end
