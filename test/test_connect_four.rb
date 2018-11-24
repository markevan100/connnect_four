gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/connect_four'
require_relative '../lib/board'
require_relative '../lib/guess'
require_relative '../lib/comp_guess'
require 'pry'

class ConnectTest < Minitest::Test

  #These are board tests
  def test_board_exists
    new_board = Board.new
    assert_instance_of Board, new_board
  end

  def test_board_initiates_empty
    new_board = Board.new
    assert_equal ".", new_board.layout[6][0]
  end

  def test_board_can_be_updated_by_placing_pieces
    new_board = Board.new
    new_board.layout[6][0] = "x"
    bottom_row = new_board.layout[6]
    assert_equal "x......", bottom_row
  end

  def test_player1_turn_updates_board
    new_board = Board.new
    new_guess = Guess.new(4)
    new_board.player1_turn(new_guess.col)
    bottom_row = new_board.layout[6]
    assert_equal "...x...", bottom_row
  end

  def test_player1_turn_updates_board_multiple_rows
    new_board = Board.new
    guess1 = Guess.new(4)
    guess2 = Guess.new(4)
    guess3 = Guess.new(4)
    new_board.player1_turn(guess1.col)
    new_board.player1_turn(guess2.col)
    new_board.player1_turn(guess3.col)
    third_row = new_board.layout[4]
    assert_equal "...x...", third_row
  end

  def test_column_fills_up
    new_board = Board.new
    guess1 = Guess.new(4)
    guess2 = Guess.new(4)
    guess3 = Guess.new(4)
    guess4 = Guess.new(4)
    guess5 = Guess.new(4)
    guess6 = Guess.new(4)
    guess7 = Guess.new(4)
    new_board.player1_turn(guess1.col)
    new_board.player1_turn(guess2.col)
    new_board.player1_turn(guess3.col)
    new_board.player1_turn(guess4.col)
    new_board.player1_turn(guess5.col)
    new_board.player1_turn(guess6.col)
    this = new_board.player1_turn(guess7.col)
    assert_equal "That column is full.", this
  end

  #These are player guess tests
  def test_guess_exists_and_takes_a_number
    new_guess = Guess.new(9)
    assert_instance_of Guess, new_guess
  end

  def test_guess_returns_a_column
    new_guess = Guess.new(4)
    assert_equal 4, new_guess.col
  end

  #These are computer guess tests
  def test_computer_guess
    new_guess = CompGuess.new
    assert_instance_of CompGuess, new_guess
    assert new_guess.num >= 0
    assert new_guess.num <= 6
    assert_equal Integer, new_guess.num.class
  end

  #These are win condition tests
  def test_horizontal_win_for_player
    new_board = Board.new
    guess1 = Guess.new(4)
    guess2 = Guess.new(3)
    guess3 = Guess.new(2)
    guess4 = Guess.new(1)
    new_board.player1_turn(guess1.col)
    new_board.player1_turn(guess2.col)
    new_board.player1_turn(guess3.col)
    new_board.player1_turn(guess4.col)
    assert new_board.win?
  end
end
