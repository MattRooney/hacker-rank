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
    if vertical_check.nil?
      horizontal_check
    else
      vertical_check
    end
  end

  def vertical_check
    if @mario.y > @princess.y
      @mario.y -= 1
      puts 'UP'
    elsif @mario.y < @princess.y
      @mario.y += 1
      puts 'DOWN'
    end
  end

  def horizontal_check
    if @mario.x > @princess.x
      @mario.x -= 1
      puts 'LEFT'
    elsif @mario.x < @princess.x
      @mario.x += 1
      puts 'RIGHT'
    end
  end

  def over
    [@mario.y, @mario.x] == [@princess.y, @princess.x]
  end
end

# Create player objects
class Player
  attr_accessor :y, :x

  def initialize(y = 0, x = 0)
    @y = y
    @x = x
  end
end

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
