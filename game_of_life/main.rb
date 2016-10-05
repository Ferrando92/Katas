require 'test/unit'

class Cell
  def initialize
    @turn = 1
    @alive = true
  end

  def alive?
    @alive
  end

  def kill
    @alive = false
  end

  def alive_one_more_turn
    @turn += 1
  end
end

class Game
  MAX_POPULATION = 3
  MIN_POPULATION = 2
  NUMBER_OF_ROWS = 100
  NUMBER_OF_COLUMNS = 100

  attr_reader :board

  def initialize
    @board = Board.new(NUMBER_OF_ROWS, NUMBER_OF_COLUMNS)
  end
end

class Board
  attr_reader :positions

  def initialize(number_of_rows, number_of_columns)
    @positions = Array.new(number_of_rows) { Array.new(number_of_columns) }
    initial_cells = { 39 => '60', 40 => '62', 41 => '59-60-63-64-65' }
    put_cells_into_board(initial_cells)
  end

  def put_cells_into_board(bunch_of_cells)
    bunch_of_cells.each do |row, values|
      format_value(values).each do |column|
        create_cell(row, column)
      end
    end
  end

  def format_value(values)
    values.split('-')
  end

  def create_cell(row, column)
    @positions[row.to_i][column.to_i] = Cell.new
  end
end

# TEST CASES
class TestGOL < Test::Unit::TestCase
  def setup
    @game = Game.new
  end

  def test_initial_positions
    assert_equal(true, @game.board.positions[39][60].instance_of?(Cell))
    assert_equal(true, @game.board.positions[40][62].instance_of?(Cell))
    assert_equal(true, @game.board.positions[41][59].instance_of?(Cell))
    assert_equal(true, @game.board.positions[41][60].instance_of?(Cell))
    assert_equal(true, @game.board.positions[41][63].instance_of?(Cell))
    assert_equal(true, @game.board.positions[41][64].instance_of?(Cell))
    assert_equal(true, @game.board.positions[41][65].instance_of?(Cell))
  end

  def second_innitial_test
    expected_board = Array.new(100, Array.new(100))
    expected_board[39][60] = Cell.new
    expected_board[40][62] = Cell.new
    expected_board[41][59] = Cell.new
    expected_board[41][60] = Cell.new
    expected_board[41][63] = Cell.new
    expected_board[41][64] = Cell.new
    expected_board[41][65] = Cell.new
    assert_equal(expected_board, @game.board.positions)
  end
end
