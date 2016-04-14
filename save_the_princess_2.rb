class Player
  attr_reader :x, :y

  def initialize(y, x)
    @x = x
    @y = y
  end
end

class Game
  attr_reader :board, :board_size
  attr_accessor :mario, :princess

  def initialize(n, r, c, grid)
    @board = grid
    @board_size = n
    @mario = Player.new(r, c)
  end

  def find_princess_location(board)
    coordinates_array = scan_board_for(board, 'p')
    princess_coordinates = coordinates_array.compact.flatten
    Player.new(princess_coordinates[0], princess_coordinates[1])
  end

  def scan_board_for(board, x)
    board.map do |row|
      if row.chars.include?(x)
        [board.index(row), row.chars.index(x)]
      end
    end
  end

  def next_move
    @princess ||= find_princess_location(@board)
    if vertical_check(@mario.y, @princess.y).nil?
      puts horizontal_check(@mario.x, @princess.x)
    else
      puts vertical_check(@mario.y, @princess.y)
    end
  end

  def vertical_check(player_y, princess_y)
    if player_y > princess_y
      "UP"
    elsif player_y < princess_y
      "DOWN"
    else
      nil
    end
  end

  def horizontal_check(player_x, princess_x)
    if player_x > princess_x
      puts "LEFT"
    elsif player_x < princess_x
      puts "RIGHT"
    else
      puts "You saved the Princess!"
    end
  end
end

# read input
n = gets.to_i

r, c = gets.strip.split.map { |num| num.to_i }

grid = Array.new(n)

(0...n).each do |i|
  grid[i] = gets
end

game = Game.new(n, r, c, grid)
game.next_move
