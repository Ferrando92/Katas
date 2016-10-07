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
    expected_board[39][60] = Cell.new(39, 60)
    expected_board[40][62] = Cell.new(40, 62)
    expected_board[41][59] = Cell.new(41, 59)
    expected_board[41][60] = Cell.new(41, 60)
    expected_board[41][63] = Cell.new(41, 63)
    expected_board[41][64] = Cell.new(41, 64)
    expected_board[41][65] = Cell.new(41, 65)
    assert_equal(expected_board, @game.board.positions)
  end
end