require './save_the_princess/lib/game'

puts 'Please enter a board size between 3 and 100:'
board_size = gets.to_i
game = Game.new(board_size)
puts game.board.board
game.display_path_to_princess
