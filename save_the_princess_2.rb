# Create game and handle game logic
class Game
  attr_reader :board
  attr_accessor :mario, :princess

  def initialize(mario_starting_row, mario_starting_column, grid)
    @board = grid
    @mario = Player.new(mario_starting_row, mario_starting_column)
    princess_y, princess_x = find_princess_coordinates
    @princess = Player.new(princess_y, princess_x)
  end

  def find_princess_coordinates
    coordinates_array = scan_board_for(@board, 'p')
    coordinates_array.compact.flatten
  end

  def scan_board_for(board, letter)
    board.map do |row|
      [board.index(row), row.chars.index(letter)] if row.chars.include?(letter)
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

puts 'Please enter a board size between 3 and 100:'

board_size = gets.to_i

puts "Now enter Mario's starting row number and column number, respectively,
separated by a space. Note - the top left corner being equal to 0, 0 and the
bottom right being equal to #{board_size - 1}, #{board_size - 1}."

mario_starting_row, mario_starting_column = gets.strip.split.map(&:to_i)

grid = Array.new(board_size)

(0...board_size).each do |row|
  grid[row] = '-' * board_size
end

grid[mario_starting_row][mario_starting_column] = 'm'
grid[rand(0..board_size)][rand(0..board_size)] = 'p'
# run
game = Game.new(mario_starting_row, mario_starting_column, grid)

puts grid

game.next_move until game.over
