def next_gen cells
die = 0
live = 1
next_gen_cells = Array.new(cells.length) { Array.new(cells.length) }
  cells.each_with_index do |row,row_i|
    row.each_with_index do |column, column_i|
      must_live?(cells, row_i, column_i) ? apply_gen_rule(live, row_i, column_i, next_gen_cells) : apply_gen_rule(die, row_i, column_i, next_gen_cells)
      #puts htmlize(next_gen_cells)      
    end
  end
  puts htmlize(next_gen_cells)
  next_gen_cells
end

def must_live? cells, cell_row, cell_column
  alive_cells = number_of_cells_alive(cells, cell_row, cell_column)
  if(cells[cell_row][cell_column] == 1)
    (alive_cells < 4) && (alive_cells > 1)
  else
    alive_cells == 3 
  end
end

def number_of_cells_alive cells, cell_row, cell_column
  alive_cells_around = 0
  #puts cell_row
  #puts cell_column
  # SUPERIOR ROW
  if((cell_row - 1) > 0)
    if((cell_column - 1) >  0)
      alive_cells_around += 1 if cells[cell_row - 1][cell_column - 1] == 1   
      #puts cells[cell_row - 1][cell_column - 1] == 1
    end
  
    alive_cells_around += 1 if cells[cell_row - 1][cell_column] == 1   
    #puts cells[cell_row - 1][cell_column] == 1

    if((cell_column + 1) < cells.length)
      alive_cells_around += 1 if cells[cell_row - 1][cell_column + 1] == 1
      #puts cells[cell_row - 1][cell_column + 1] == 1   
    end
  end
  
  # CELL_ROW
  if((cell_column - 1) >  0)
    alive_cells_around += 1 if cells[cell_row][cell_column - 1] == 1
    #puts cells[cell_row][cell_column - 1] == 1
  end
      
  if((cell_column + 1) < cells.length)
    alive_cells_around += 1 if cells[cell_row][cell_column + 1] == 1
    #puts cells[cell_row][cell_column + 1] == 1   
  end
     
  
  # INFERIOR ROW
  if((cell_row + 1) < cells.length)
    if((cell_column - 1) >  0)
      alive_cells_around += 1 if cells[cell_row + 1][cell_column - 1] == 1
    end
  
    alive_cells_around += 1 if cells[cell_row + 1][cell_column] == 1   
  
    if((cell_column + 1) < cells.length)
      alive_cells_around += 1 if cells[cell_row + 1][cell_column + 1] == 1   
    end
  end
  alive_cells_around
end

def apply_gen_rule rule, cell_row, cell_column, next_gen_cells
  next_gen_cells[cell_row][cell_column] = rule
end