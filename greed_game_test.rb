require "game"
require "test/unit"

class GreedGameTest < Test::Unit::TestCase

  def test_game_raises_error_with_zero_players
    assert_raises(GreedGame::NoPlayersError) do
      game = GreedGame.new
    end
  end

  def test_new_game_has_one_or_more_players
    game = GreedGame.new("Chenoa")
    assert_equal ["Chenoa"], game.player_names

    game2 = GreedGame.new("Chenoa", "Rich")
    assert_equal %w[Chenoa Rich], game2.player_names
  end
  
  def test_players_start_game_with_score_of_zero
    game = GreedGame.new("Chenoa", "Rich")
    assert_equal [0,0], game.player_scores
  end
  
  def test_player_rolls_five_dice
    game = GreedGame.new("Chenoa", "Rich")
    dice = game.roll
    assert_equal 5, dice.size
  end
  
  def test_first_player_has_first_turn
    game = GreedGame.new("Chenoa", "Rich", "Floyd", "Cinderella")
    assert_equal "Chenoa", game.whose_turn?
  end
  
  def test_turns_go_in_order_of_player_entry_at_initialize
    game = GreedGame.new("Chenoa", "Rich", "Floyd", "Cinderella")
    game.roll
    assert_equal "Rich", game.whose_turn?
    
    game.roll
    assert_equal "Floyd", game.whose_turn?
    
    game.roll
    assert_equal "Cinderella", game.whose_turn?
  end
  
  def test_roll_of_zero_points_ends_turn_with_no_addition_to_score
    game = GreedGame.new("Chenoa", "Rich")
    player = game.whose_turn?
    roll_of_dice = [2, 3, 4, 3, 6]
    game.score(roll_of_dice, player)
    assert_not_equal game.whose_turn?, player
  end
  
  def test_player_can_roll_unscoring_dice_again
  end
  
  def test_player_can_keep_points_to_end_turn
  end
  
  def test_players_score_is_incremented_when_player_keeps_points
  end
  
  def test_player_input_controls_subsequent_rolls_in_turn
  end
  

  
  def test_when_someones_score_goes_over_five_thousand_everyone_left_in_rotation_gets_one_more_turn
  end
  
  def test_player_with_highest_score_at_end_wins
  end
    
=begin  

    if points(@dice) == 0
      puts "Your turn is over!"
    else
      @score += points(@dice)
    end
    
    
  def test_dice_roll_adds_to_players_score
    p = Player.new("Pete")
    r = Player.new("Roger")
    r.roll(10)
    assert r.score > p.score
  end
  
  def test_player_can_roll_unscoring_dice_from_previous_roll
    d = Player.new("Dude")
    dice = [1,1,3,2,5]
    assert_equal [3,2], unscoring_dice
    d.roll
    assert_equal 
  end
  
  def test_if_player_rolls_zero_points_turn_ends_with_no_points_gained
    #how in the world can I test this?
  end
=end
end
