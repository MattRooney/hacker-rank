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
  four_corners = [ grid[0][0], grid[0][-1], grid[-1][0], grid[-1][-1] ]
  four_results = [ "top left", "top right", "bottom left", "bottom right"]
  four_corners.each_with_index do |corner, index|
    return four_results[index] if corner == "p"
  end
end

def move(direction, n, moves)
  ((n - 1)/2).times do
    moves << direction
  end
end

#read input
m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

display_path_to_princess(m,grid)
