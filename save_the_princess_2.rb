require './save_the_princess_2/lib/game'

puts 'Please enter a board size between 3 and 100:'
board_size = gets.to_i

puts "Now enter Mario's starting row number and column number, respectively,
separated by a space. Note - the top left corner being equal to 0, 0 and the
bottom right being equal to #{board_size - 1}, #{board_size - 1}."
mario_starting_row, mario_starting_column = gets.strip.split.map(&:to_i)

game = Game.new(mario_starting_row, mario_starting_column, board_size)
puts game.board.grid
game.next_move until game.over
