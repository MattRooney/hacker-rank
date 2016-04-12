def display_path_to_princess(n, grid)
  moves = []

  case princess_location(n, grid)
    when "top left"
      ((n - 1)/2).times do
        moves << "UP"
      end
      ((n - 1)/2).times do
        moves << "LEFT"
      end
    when "top right"
      ((n - 1)/2).times do
        moves << "UP"
      end
      ((n - 1)/2).times do
        moves << "RIGHT"
      end
    when "bottom left"
      ((n - 1)/2).times do
        moves << "DOWN"
      end
      ((n - 1)/2).times do
        moves << "LEFT"
      end
    when "bottom right"
      ((n - 1)/2).times do
        moves << "DOWN"
      end
      ((n - 1)/2).times do
        moves << "RIGHT"
      end
    else
      puts "The Princess is not in one of the four corners!"
  end

  puts moves.join("\n") + "\n"
end

def princess_location(n, grid)
  if grid.first[0] == "p"
    "top left"
  elsif grid.first[n-1] == "p"
    "top right"
  elsif grid.last[0] == "p"
    "bottom left"
  elsif grid.last[n-1] == "p"
    "bottom right"
  else
    "Error"
  end
end


#read input
m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
