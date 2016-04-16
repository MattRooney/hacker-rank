require './lib/save_the_princess'
require 'minitest/autorun'
require 'minitest/pride'

class SaveThePrincessTest < Minitest::Test

  def test_it_creates_a_board
    game = Game.new(5)

    assert game.board
  end

  def test_it_creates_a_board_with_correct_size
    game     = Game.new(5)
    game_two = Game.new(99)

    assert 5, game.board_size
    assert 99, game_two.board_size
  end

  def test_it_instantiates_mario_and_princess_automatically
    game = Game.new(5)

    assert game.mario
    assert game.princess
  end

  def test_mario_starts_in_the_middle_of_the_board
    game = Game.new(5)

    assert_equal 2, game.mario.x
    assert_equal 2, game.mario.y
  end

  def test_mario_starts_in_the_middle_of_even_size_board
    game = Game.new(6)

    assert_equal 3, game.mario.x
    assert_equal 3, game.mario.y
  end

  def test_princess_is_in_a_corner
    game = Game.new(5)

    assert [0, 4].include?(game.princess.x)
    assert [0, 4].include?(game.princess.y)
  end

  def test_mario_finds_princess_in_top_left_corner
    game = Game.new(5)
    game.princess.x, game.princess.y = [0, 0]

    assert_equal ['UP', 'UP', 'LEFT', 'LEFT'], game.path_to_princess
  end

  def test_mario_finds_princess_in_top_right_corner
    game = Game.new(6)
    game.princess.x, game.princess.y = [5, 0]

    assert_equal ['UP', 'UP', 'UP', 'RIGHT', 'RIGHT'], game.path_to_princess
  end

  def test_mario_finds_princess_in_bottom_right_corner
    game = Game.new(7)
    game.princess.x, game.princess.y = [6, 6]

    assert_equal ['DOWN', 'DOWN', 'DOWN', 'RIGHT', 'RIGHT', 'RIGHT'],
                 game.path_to_princess
  end

  def test_mario_finds_princess_in_bottom_left_corner
    game = Game.new(8)
    game.princess.x, game.princess.y = [0, 7]

    assert_equal ['DOWN', 'DOWN', 'DOWN', 'LEFT', 'LEFT', 'LEFT', 'LEFT'],
                 game.path_to_princess
  end

  def test_mario_finds_princess_on_a_large_board
    game = Game.new(25)
    game.princess.x, game.princess.y = [0, 0]

    assert_equal ['UP', 'UP', 'UP', 'UP', 'UP', 'UP', 'UP', 'UP', 'UP', 'UP',
                  'UP', 'UP', 'LEFT', 'LEFT', 'LEFT', 'LEFT','LEFT', 'LEFT',
                  'LEFT', 'LEFT', 'LEFT', 'LEFT','LEFT', 'LEFT'],
                 game.path_to_princess
  end

end
