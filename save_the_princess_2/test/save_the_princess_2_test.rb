require_relative '../lib/game'
require 'minitest/autorun'
require 'minitest/pride'

class SaveThePrincess2Test < Minitest::Test
  def test_it_creates_a_board
    game = Game.new(5, 5, 10)

    assert game.board
  end


end
