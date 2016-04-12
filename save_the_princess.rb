def display_path_to_princess(n, grid)
  if princess_location == "top left"
  end
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
