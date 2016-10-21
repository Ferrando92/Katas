require 'colorize'

def next_gen cells

die = 0
live = 1
next_gen_cells = Array.new(cells.length) { Array.new(cells.length) }
  cells.each_with_index do |row,row_i|
    row.each_with_index do |column, column_i|
      must_live?(cells, row_i, column_i) ? apply_gen_rule(live, row_i, column_i, next_gen_cells) : apply_gen_rule(die, row_i, column_i, next_gen_cells)
    end
  end
  print_gen(next_gen_cells)
  next_gen_cells
end

def print_gen(gen)
  board = ''

  colors = [" ◌".colorize(:light_black), " ●".colorize(:light_blue)]
  gen.each do|row|
    row.each {|cell| board += colors[cell]}
    board += "\n"
  end
  puts board
end

def must_live? cells, cell_row, cell_column
  alive_cells = number_of_cells_around_refactor(cells, cell_row, cell_column)
  if(cells[cell_row][cell_column] == 0)
    alive_cells == 3
  else
    (alive_cells < 4) && (alive_cells > 1)
  end
end

def number_of_cells_around_refactor cells, cell_row, cell_column
  alive_cells_around = 0
  (cell_row - 1).upto(cell_row + 1) do |i|
    if (i < cells.length && i >= 0)
      is_the_current_cell_row = i == cell_row
      alive_cells_around += check_row_columns(cells[i], cell_column, is_the_current_cell_row)
    end
  end
  alive_cells_around

end

def check_row_columns columns, cell_column, is_the_current_cell_row
  alive_cells_row = 0
  (cell_column - 1).upto(cell_column + 1) do |i|
    is_the_current_cell = i ==cell_column if is_the_current_cell_row
    alive_cells_row += check_cell(columns[i]) if (i < columns.length && i >=  0 && !is_the_current_cell)
  end
  alive_cells_row
end

def check_cell(cell)
  cell
end



def apply_gen_rule rule, cell_row, cell_column, next_gen_cells
  next_gen_cells[cell_row][cell_column] = rule
end
genesis = next_gen(blinker = [
           [0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0],
           [0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0],
           [0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0],
           [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
           [0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0],
           [0,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0],
           [0,0,0,1,0,1,1,0,0,0,1,1,0,1,0,0,0],
           [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
           [0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0],
           [0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0],
           [0,1,1,1,0,1,1,0,0,0,1,1,0,1,1,1,0],
           [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
           [0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0],
           [0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0],
           [0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0]])
 50.times do
    genesis = next_gen(genesis)
    sleep(0.50)
end
