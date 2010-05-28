require "game"
require "fake_dice"
require "test/unit"

class GreedGameTest < Test::Unit::TestCase

  def test_game_raises_error_with_zero_players
    assert_raises(GreedGame::NoPlayersError) do
      game = GreedGame.new
    end
  end

  def test_new_game_has_one_or_more_players
    game = GreedGame.new([chenoa])
    assert_equal chenoa, game.players

    game2 = GreedGame.new([chenoa, rich, floyd])
    assert_equal %w[chenoa rich floyd], game2.players
  end
=begin  
  def test_players_start_game_with_score_of_zero
    game = GreedGame.new(["Chenoa", "Rich"])
    assert_equal [0,0], game.player_scores
  end
  
  def test_player_rolls_five_dice
    game = GreedGame.new(["Chenoa", "Rich"], AllScoringDice.new)
    dice = game.roll
    assert_equal 5, dice.size
  end

  def test_first_player_has_first_turn
    game = GreedGame.new(["Chenoa", "Rich", "Floyd", "Cinderella"])
    assert_equal "Chenoa", game.current_player
  end
  
  def test_turns_go_in_order_of_player_entry_at_initialize
    game = GreedGame.new(["Chenoa", "Rich", "Floyd", "Cinderella"], UnscoringDice.new)
    game.roll
    assert_equal "Rich", game.current_player
    
    game.roll
    assert_equal "Floyd", game.current_player
    
    game.roll
    assert_equal "Cinderella", game.current_player
  end

  def test_roll_of_zero_points_ends_turn_with_no_addition_to_score
    game = GreedGame.new(["Chenoa", "Rich"], UnscoringDice.new)
    player = game.current_player
    game.roll
    
    assert_not_equal game.current_player, player
    assert_equal 0, game.players.last.score
  end
=begin  
  def test_player_can_roll_unscoring_dice_again
    game = GreedGame.new(["Chenoa", "Rich"], SomeScoringDice.new)
    player = game.current_player
    first_players_turn = game.roll
    
    assert_equal player, game.current_player
  end
  
  def test_player_can_keep_points_to_end_turn
    game = GreedGame.new(["Chenoa", "Rich"], SomeScoringDice.new)
    player = game.current_player
    game.roll
    game.keep_points
    
    assert_equal game.players.last.score, 150
    assert_not_equal player, game.current_player
  end
  
  def test_players_score_is_incremented_when_player_keeps_points
    game = GreedGame.new(["Chenoa", "Ansel"], SomeScoringDice.new)
    game.roll
    game.keep_points
    
    assert_equal game.players.last.score, 150
  end
  
  def test_player_can_select_which_dice_to_roll_again
    game = GreedGame.new(["Chenoa", "Ehren"], SomeScoringDice.new)
    game.roll
    dice = game.roll_again([2, 3, 4])
    
    assert_equal 3, dice.size
  end

  def test_dice_not_selected_to_roll_again_are_added_to_temp_score
    game = GreedGame.new(["Inky", "Toby"], SomeScoringDice.new)
    game.roll
    dice = game.roll_again([2,3,4])
    
    assert_equal 150, game.temp_score
  end
  
  def test_after_switching_turns_temp_score_is_zero
    game = GreedGame.new(["Eli", "Floyd"], SomeScoringThenUnscoringDice.new)
    game.roll
    #is this necessary?
    #assert_equal 150, game.temp_score
    
    game.roll_again([2,3,4])
    
    assert_equal 0, game.temp_score
  end

  def test_leaving_unscoring_dice_when_rolling_again_raises_error
  end

  def test_when_someones_score_goes_over_five_thousand_everyone_left_in_rotation_gets_one_more_turn
    game = GreedGame.new(["Chenoa", "Ansel"], AllScoringDice.new)
    game.players.first.score = 4500

    game.roll
    game.keep_points

    #game.play do   
    #  game.players.each do |p|
    #    p.play_turn
    #  end
    #end
    game.roll
    game.keep_points

    assert_raises(GreedGame::EndOfGame) do
      game.roll
    end
  end
  
  def test_player_with_highest_score_at_end_wins
    game = GreedGame.new(["Chenoa", "Ansel"], AllScoringDice.new)
    game.players.first.score = 4500

    game.roll
    game.keep_points

    game.roll
    assert_equal "Chenoa Wins!", game.keep_points
  end
=end
end
