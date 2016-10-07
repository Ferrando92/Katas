require './board'
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

  def play(number_of_generations = 200)
    (0..number_of_generations)
      apply_generation
  end

  def apply_generation #calls evolution cell in each cell
    @board.iterate_board_an_do { |row, column| evolution_the_cell(@board.positions[row][column]) }
  end

  def evolution_the_cell(cell)
    if(can_the_cell_live?(get_cells_alive_around(cell)))
      cell.is_alive? ? cell.one_more_generation : cell.born(@actual_generation)
    else
      cell.kill
    end
  end

  def can_the_cell_live?(number_of_cells_alive)
    if(number_of_cells_alive == MAX_POPULATION || number_of_cells_alive == MIN_POPULATION)
      true
    else
      false
    end
  end

  def get_cells_alive_around(cell)
    number_of_cells_alive = 0
    number_of_cells_alive += get_alive_cells_from_not_actual_row(cell.row - 1, cell.column)
    number_of_cells_alive += get_alive_cells_from_actual_row(cell.row, cell.column)
    number_of_cells_alive
  end

  def get_alive_cells_from_not_actual_row(row, column)
    cells_alive_in_this_row = 0
    (column - 1..column + 1).each do |column_iterator|
      if @board.positions[row][column_iterator]#.is_alive?
        cells_alive_in_this_row += 1
      end
    end
    cells_alive_in_this_row
  end

  def get_alive_cells_from_actual_row(row, column)#puede darse el caso de no haber a uno de los lados
    cells_alive_in_this_row = 0
    @board.positions[row][column - 1].is_alive? && cells_alive_in_this_row += 1
    @board.positions[row][column + 1].is_alive? && cells_alive_in_this_row += 1
    cells_alive_in_this_row
  end
end
