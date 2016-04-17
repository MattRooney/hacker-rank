require_relative 'board'
require_relative 'player'
require 'pry'
# Create game and handle game logic
class Game
  attr_reader :board
  attr_accessor :mario, :princess

  def initialize(mario_starting_row, mario_starting_column, board_size)
    @board = Board.new(mario_starting_row, mario_starting_column, board_size)
    @mario = Player.new(mario_starting_row, mario_starting_column)
    princess_y, princess_x = find_princess_coordinates
    @princess = Player.new(princess_y, princess_x)
  end

  def find_princess_coordinates
    coordinates_array = scan_board_for('p')
    coordinates_array.compact.flatten
  end

  def scan_board_for(letter)
    @board.grid.map do |row|
      [@board.grid.index(row), row.chars.index(letter)] if row.chars.include?(letter)
    end
  end

  def next_move
    if (@mario.y == @princess.y)
      horizontal_move
    else
      vertical_move
    end
  end

  def vertical_move
    if @mario.y > @princess.y
      @mario.y -= 1
      'UP'
    elsif @mario.y < @princess.y
      @mario.y += 1
      'DOWN'
    end
  end

  def horizontal_move
    if @mario.x > @princess.x
      @mario.x -= 1
      'LEFT'
    elsif @mario.x < @princess.x
      @mario.x += 1
      'RIGHT'
    end
  end

  def over
    [@mario.y, @mario.x] == [@princess.y, @princess.x]
  end
end
