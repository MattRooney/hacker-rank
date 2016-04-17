# Create and populate board
class Board
  attr_reader :board, :board_size
  def initialize(board_size)
    @board = Array.new(board_size)
    create_board(board_size)
    populate_board(board_size)
  end

  def create_board(board_size)
    (0...board_size).each do |row|
      @board[row] = '-' * board_size
    end
  end

  def populate_board(board_size)
    add_mario(board_size)
    add_princess(board_size)
  end

  def add_mario(board_size)
    @board[(board_size / 2)][(board_size / 2)] = 'm'
  end

  def add_princess(board_size)
    four_corners = [0, 0], [0, -1], [-1, 0], [-1, -1]
    princess_row, princess_column = four_corners[rand(0..3)]
    @board[princess_row][princess_column] = 'p'
  end
end
