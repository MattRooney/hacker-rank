require_relative '../lib/game'
require 'minitest/autorun'
require 'minitest/pride'

class SaveThePrincess2Test < Minitest::Test
  def test_it_creates_a_board
    game = Game.new(5, 5, 10)

    assert game.board
  end

  def test_it_creates_a_board_with_correct_size
    game     = Game.new(5, 12, 20)
    game_two = Game.new(3, 3, 99)

    assert_equal 20, game.board.grid.length
    assert_equal 99, game_two.board.grid.length
  end

  def test_it_instantiates_mario_and_princess_automatically
    game = Game.new(5, 12, 24)

    assert game.mario
    assert game.princess
  end

  def test_mario_and_princess_start_in_different_places
    10.times do
      game = Game.new(1, 1, 3)

      refute_equal [game.princess.y, game.princess.x],
                   [game.mario.y, game.mario.x]
    end
  end

  def test_mario_finds_princess_in_top_left_corner
    game = Game.new(2, 2, 5)
    game.princess.y, game.princess.x = [0, 0]

    assert_equal [2, 2], [game.mario.y, game.mario.x]

    assert_equal 'UP', game.next_move

    assert_equal [1, 2], [game.mario.y, game.mario.x]

    assert_equal 'UP', game.next_move

    assert_equal [0, 2], [game.mario.y, game.mario.x]

    assert_equal 'LEFT', game.next_move

    assert_equal [0, 1], [game.mario.y, game.mario.x]

    assert_equal 'LEFT', game.next_move

    assert_equal [0, 0], [game.mario.y, game.mario.x]
  end
end
