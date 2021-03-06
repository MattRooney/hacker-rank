require_relative 'board'
require_relative 'player'

# Create game and handle game logic
class Game
  attr_reader :board_size
  attr_accessor :board, :mario, :princess

  def initialize(board_size)
    @board = Board.new(board_size)
    @board_size = board_size
    @mario = Player.new((board_size / 2), (board_size / 2))
    princess_y, princess_x = find_princess_coordinates
    @princess = Player.new(princess_y, princess_x)
  end

  def display_path_to_princess
    puts path_to_princess
  end

  def path_to_princess
    moves = []
    move_up_or_down(moves) until same_row
    move_left_or_right(moves) until same_column
    moves
  end

  def move_up_or_down(moves)
    if @mario.y > @princess.y
      @mario.y -= 1
      moves << 'UP'
    elsif @mario.y < @princess.y
      @mario.y += 1
      moves << 'DOWN'
    end
  end

  def move_left_or_right(moves)
    if @mario.x > @princess.x
      @mario.x -= 1
      moves << 'LEFT'
    elsif @mario.x < @princess.x
      @mario.x += 1
      moves << 'RIGHT'
    end
  end

  def find_princess_coordinates
    max_xy = @board_size - 1
    four_corners = [0, 0], [0, max_xy], [max_xy, 0], [max_xy, max_xy]
    coordinates_array = scan_four_corners(four_corners, 'p')
    coordinates_array.compact.flatten
  end

  def scan_four_corners(four_corners, character)
    four_corners.map do |corner|
      corner if @board.board[corner[0]][corner[1]] == character
    end
  end

  def same_column
    @mario.x == @princess.x
  end

  def same_row
    @mario.y == @princess.y
  end
end
