#!/bin/ruby
def nextMove(n,r,c,grid)
  player_location = grid[r][c]

  puts "0 0"
end

def princess_location(grid)
  princess_coordinates = []
  grid.each do |row|
    if row.chars.include?("p")
      princess_coordinates << grid.index(row)
      princess_coordinates << row.chars.index("p")
    end
  end
  princess_coordinates
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
