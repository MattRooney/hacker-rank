class Game
  attr_reader :board
  attr_accessor :mario, :princess

  def initialize(board_size, grid)
    @board_size = board_size
    @grid = grid
    @mario = Player.new((board_size / 2), (board_size / 2))
    @princess = Player.new(find_princess_coordinates[0], find_princess_coordinates[1])
  end

  def display_path_to_princess
    puts path_to_princess
  end

  def path_to_princess
    moves = []
    until @mario.y == @princess.y && @mario.x == @princess.x
      if @mario.y > @princess.y
        @mario.y -= 1
        moves << "UP"
      elsif @mario.y < @princess.y
        @mario.y += 1
        moves << "DOWN"
      elsif @mario.x > @princess.x
        @mario.x -= 1
        moves << "LEFT"
      elsif @mario.x < @princess.x
        @mario.x += 1
        moves << "RIGHT"
      end
    end
    moves
  end

  def find_princess_coordinates
    max_coord = @board_size - 1
    four_corners = [0, 0], [0, max_coord], [max_coord, 0], [max_coord, max_coord]
    coordinates_array = scan_four_corners(four_corners, 'p')
    coordinates_array.compact.flatten
  end

  def scan_four_corners(four_corners, character)
    four_corners.map do |corner|
      corner if @grid[corner[0]][corner[1]] == character
    end
  end
end

class Player
  attr_accessor :y, :x

  def initialize(y, x)
    @y = y
    @x = x
  end
end

puts "Please enter a board size between 3 and 100:"

board_size = gets.to_i

grid = Array.new(board_size)

(0...board_size).each do |row|
  grid[row] = '-' * board_size
end

grid[(board_size / 2)][(board_size / 2)] = 'm'

four_corners = [0, 0], [0, -1], [-1, 0], [-1, -1]
princess_row, princess_column = four_corners[rand(0..3)]
grid[princess_row][princess_column] = 'p'

game = Game.new(board_size, grid)
puts grid
game.display_path_to_princess
