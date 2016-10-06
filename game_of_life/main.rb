require 'test/unit'

class Cell
  def initialize(row, column)
    @born_generation = false
    @actual_generation = false
    @alive_once = false
    @alive = false
    @row = row
    @column = column
  end

  def born(generation)
    @born_generation = generation
    @actual_generation = generation
    @alive = true
    @alive_once = true
  end

  def alive?
    @alive
  end

  def alive_once?
    @alive_once
  end

  def kill
    @alive = false
  end

  def get_generation
    @generation
  end

  def one_more_generation
    @actual_generation += 1
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
    @actual_generation = 0
  end

  def play(number_of_generations = 2)
    (0..number_of_generations)
      apply_generation
  end

  def apply_generation #calls evolution cell in each cell
    @board.itereate_board_an_do { |row, column| evolution_the_cell(@board.positions[row][column]) }
  end

  def evolution_the_cell(cell)
    if(can_the_cell_live(cell.get_cells_alive_around))
      cell.alive? ? cell.one_more_generation : cell.born_generation(actual_generation)
    else
      cell.kill
    end
  end

  def can_the_cell_live?(number_of_cells_alive)
    if(number_of_cells_alive == 2 || number_of_cells_alive == 3)
      true
    else
      false
    end
  end

  def get_cells_alive_around(cell)
    number_of_cells_alive = 0
    number_of_cells_alive =+ get_alive_cells_from_not_actual_row(cell.row-1, cell.column)
    number_of_cells_alive =+ get_alive_cells_from_actual_row(cell.row, cell.column)
    number_of_cells_alive
  end

  def get_alive_cells_from_not_actaul_row(row, column)
    cells_alive_in_this_row = 0
    for column_iterator in column-1..column+1
      if @board.positions[row][column_iterator].alive? 
        cells_alive_in_this_row += 1
      end 
    end
    cells_alive_in_this_row
  end

  def get_alive_cells_from_not_actaul_row(row, column)
    cells_alive_in_this_row = 0
    if @board.positions[row][column-1].alive?
      cells_alive_in_this_row += 1
    end  
    if @board.positions[row][column+1].alive?
      cells_alive_in_this_row += 1
    end
  end
end

class Board
  attr_reader :positions

  def initialize(number_of_rows, number_of_columns)
    @positions = Array.new(number_of_rows) { Array.new(number_of_columns) }
    initial_cells = { 39 => '60', 40 => '62', 41 => '59-60-63-64-65', 99 => '99' }
    put_cells_into_board(initial_cells)
  end

  # GENERIC FUNCTIONS
  def itereate_board_an_do
    @positions.each_with_index do |values, row|
      values.each_with_index do |_value, column|
        yield(row, column)
      end
    end
  end

  def create_cell(row, column)
    @positions[row.to_i][column.to_i] = Cell.new(row.to_i, column.to_i)
  end

  # CREATION OF THE BOARD
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
    expected_board[39][60] = Cell.new(39,60)
    expected_board[40][62] = Cell.new(40,62)
    expected_board[41][59] = Cell.new(41,59)
    expected_board[41][60] = Cell.new(41,60)
    expected_board[41][63] = Cell.new(41,63)
    expected_board[41][64] = Cell.new(41,64)
    expected_board[41][65] = Cell.new(41,65)
    assert_equal(expected_board, @game.board.positions)
  end
end
