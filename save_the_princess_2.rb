#!/bin/ruby
def next_move(n, r, c, grid)
  player_coordinates   = [r, c]
  princess_coordinates = find_princess_location(grid)
  if vertical_check(player_coordinates[0], princess_coordinates[0]).nil?
    puts horizontal_check(player_coordinates[1], princess_coordinates[1])
  else
    puts vertical_check(player_coordinates[0], princess_coordinates[0])
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

def find_princess_location(grid)
  princess_coordinates = grid.map do |row|
    if row.chars.include?("p")
      [grid.index(row), row.chars.index("p")]
    end
  end
  princess_coordinates.compact.flatten
end

# read input
n = gets.to_i

r, c = gets.strip.split.map { |num| num.to_i }

grid = Array.new(n)

(0...n).each do |i|
  grid[i] = gets
end

next_move(n, r, c, grid)
