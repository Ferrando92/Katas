require './game'
#require 'gosu'
@game = Game.new
@game.play
@game.board.itereate_board_an_do{ format_view(@game.board.positions[row][column],column) }

def formatview(cell, column_iterator)
  #cell.alive? ? puts 'X' : puts 'O'
  if(column_iterator == 99)
    puts "\n"
  end
end