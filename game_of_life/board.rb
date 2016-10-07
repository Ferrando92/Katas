require'./cell'
class Board
  attr_reader :positions

  def initialize(number_of_rows, number_of_columns)
    @positions = Array.new(number_of_rows) { Array.new(number_of_columns) }
    fill_the_board
    initial_cells = { 39 => '60', 40 => '62', 41 => '59-60-63-64-65', 99 => '99' }
    put_cells_into_board(initial_cells)
  end

  # GENERIC FUNCTIONS
  def iterate_board_an_do
    @positions.each_with_index do |values, row|
      values.each_with_index do |_value, column|
        yield(row, column)
      end
    end
  end

  def create_cell(row, column)
    @positions[row.to_i][column.to_i] = Cell.new(row.to_i, column.to_i).born(0)
  end

  def fill_the_board
    iterate_board_an_do{ |row, column| @positions[row][column] = Cell.new(row, column)}
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
end
