def display_path_to_princess(n, grid)
  puts path_to_princess(n, grid).join("\n")
end

def path_to_princess(n, grid)
  moves = []
  case princess_location(grid)
  when "top left"
    move("UP", n, moves)
    move("LEFT", n, moves)
  when "top right"
    move("UP", n, moves)
    move("RIGHT", n, moves)
  when "bottom left"
    move("DOWN", n, moves)
    move("LEFT", n, moves)
  when "bottom right"
    move("DOWN", n, moves)
    move("RIGHT", n, moves)
  else
    puts "The Princess is not in one of the four corners!"
  end
  moves
end

def princess_location(grid)
  four_corners = [grid[0][0], grid[0][-1], grid[-1][0], grid[-1][-1]]
  four_results = ["top left", "top right", "bottom left", "bottom right"]
  four_corners.each_with_index do |corner, index|
    return four_results[index] if corner == "p"
  end
end

def move(direction, n, moves)
  ((n - 1) / 2).times do
    moves << direction
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

puts grid
display_path_to_princess(board_size, grid)
