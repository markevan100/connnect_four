require_relative '../lib/board'
require_relative '../lib/guess'
require_relative '../lib/comp_guess'
require 'pry'


puts "Welcome to Connect Four"
board = Board.new

loop do board.win?
  puts board.layout
  puts "Please enter the number of the column you wish to play in."
  this = gets.chomp
  yala = Guess.new(this.to_i)
  board.player1_turn(yala.col)
  re = CompGuess.new
  board.comp_turn(re.num)
  break if board.win?
end

puts board.layout
puts "Game over."









# board = [["1234567"], ["......."], ["......."], ["......."], ["......."], ["......."], ["......."]]
# puts board
#
# puts "Please enter the number of the column."
# pguess = gets.chomp
#
# board.guesses(pguess)
# puts board
#
# def guesses(guess)
#   if self[7][guess - 1] == "."
#     self[7][guess - 1] = "x"
#   elsif self[6][guess - 1] == "."
#     self[6][guess - 1] = "x"
#   elsif self[5][guess - 1] == "."
#     self[5][guess - 1] = "x"
#   elsif self[4][guess - 1] == "."
#     self[4][guess - 1] = "x"
#   elsif self[3][guess - 1] == "."
#     self[3][guess - 1] = "x"
#   elsif self[2][guess - 1] == "."
#     self[2][guess - 1] = "x"
#   elsif self[1][guess - 1] == "."
#     self[1][guess - 1] = "x"
#   else
#     puts "That column is full."
#   end
# end
