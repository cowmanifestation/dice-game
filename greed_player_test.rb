require "greed_player"
require "dice_set"
require "fake_dice"
require "test/unit"

class GreedPlayerTest < Test::Unit::TestCase

  def test_new_player_has_score_of_zero
    fred = GreedPlayer.new

    assert_equal 0, fred.score
  end

  def test_player_rolls_five_dice
    george = GreedPlayer.new
    dice = DiceSet.new
    dice_roll = george.roll_dice(dice)

    assert_equal 5, dice_roll.size
  end

  def test_player_can_keep_points_from_dice_roll
    harry = GreedPlayer.new
    dice = AllScoringDice.new
    dice_roll = harry.roll_dice(dice)
    harry.keep_points(dice_roll)

    assert_equal 1200, harry.score
  end

  #should turns be a part of greed_game or greed_player?
=begin
  def test_at_beginning_of_turn_temp_score_is_zero
  end

  def test_roll_of_zero_points_ends_turn_with_no_addition_to_score
  end
=end
  def test_player_can_select_which_dice_to_roll_again
    mathilda = GreedPlayer.new
    dice = SomeScoringDice.new
    mathilda.roll_dice(dice)
    second_roll = mathilda.roll_again(dice, [2,3,4])

    assert_equal 3, second_roll.size
  end

  def test_leaving_unscoring_dice_out_of_second_roll_raises_error
    geronimo = GreedPlayer.new
    dice = SomeScoringDice.new
    geronimo.roll_dice(dice)
    assert_raises MustRollAllUnscoringDiceAgainError do
      geronimo.roll_again([2,3])
    end
  end

  def test_dice_not_selected_to_roll_again_are_added_to_temp_score
  end

  def test_after_turn_ends_temp_score_is_reset_to_zero
  end

  def test_when_player_rolls_again_dice_not_rolled_are_added_to_temp_score
  end

end
