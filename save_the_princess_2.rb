#!/bin/ruby
def next_move(n,r,c,grid)
  player_coordinates = [r, c]
  princess_coordinates = find_princess_location(grid)
  if player_coordinates[0] > princess_coordinates[0]
    puts "UP"
  elsif player_coordinates[0] < princess_coordinates[0]
    puts "DOWN"
  elsif player_coordinates[1] > princess_coordinates[1]
    puts "LEFT"
  elsif player_coordinates[1] < princess_coordinates[1]
    puts "RIGHT"
  else
    puts "You saved the Princess!"
  end
end

def find_princess_location(grid)
  princess_coordinates = []
  grid.each do |row|
    if row.chars.include?("p")
      princess_coordinates << grid.index(row)
      princess_coordinates << row.chars.index("p")
    end
  end
  princess_coordinates
end

# read input
n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

next_move(n,r,c,grid)
