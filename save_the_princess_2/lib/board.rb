#Create and populate board
class Board
  attr_reader :grid
  def initialize(mario_starting_row, mario_starting_column, board_size)
    @grid = Array.new(board_size)
    create_board(board_size)
    populate_board(mario_starting_row, mario_starting_column, board_size)
  end

  def create_board(board_size)
    (0...board_size).each do |row|
      @grid[row] = '-' * board_size
    end
  end

  def populate_board(mario_starting_row, mario_starting_column, board_size)
    add_mario(mario_starting_row, mario_starting_column)
    add_princess(board_size)
  end

  def add_mario(mario_starting_row, mario_starting_column)
    @grid[mario_starting_row][mario_starting_column] = 'm'
  end

  def add_princess(board_size)
    @grid[rand(0..board_size)][rand(0..board_size)] = 'p'
  end
end
