class Cell
  attr_reader :row, :column
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

  def is_alive?
    @alive
  end

  def alive_once?
    @alive_once
  end

  def kill
    @alive = false
  end

  def get_generation
    @actual_generation
  end

  def one_more_generation
    @actual_generation += 1
  end
end
