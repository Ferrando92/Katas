class InformationMaps
  TURNS_RIGHT_MAPPING = { NORTH: :EAST , EAST: :SOUTH, SOUTH: :WEST, WEST: :NORTH }
  TURNS_LEFT_MAPPING = { NORTH: :WEST , EAST: :NORTH, SOUTH: :EAST, WEST: :SOUTH }
  STEP_FORWARD_MAPPING = { NORTH: 0, EAST: 1, SOUTH: 0, WEST: 1 }
end

class InformationData
  X_POSITION = 0
  Y_POSITION = 1
end

class Planet
  attr_reader :number_of_rows
  attr_reader :number_of_columns

  def initialize(dimension_x, dimension_y)
    @number_of_rows = dimension_x
    @number_of_columns = dimension_y
  end

  def at_the_edge?(rover_position, rover_orientation)
    if rover_orientation == :EAST
      rover_position[InformationData::Y_POSITION] == @number_of_columns - 1
    elsif rover_orientation == :WEST
      rover_position[InformationData::Y_POSITION].zero?
    elsif rover_orientation == :SOUTH
      rover_position[InformationData::X_POSITION] == @number_of_rows - 1
    elsif rover_orientation == :NORTH
      rover_position[InformationData::X_POSITION].zero?
    end
  end
end

class MarsRover
  RIGHT = InformationMaps::TURNS_RIGHT_MAPPING
  LEFT = InformationMaps::TURNS_LEFT_MAPPING
  DIRECTION = InformationMaps::STEP_FORWARD_MAPPING
  X_POSITION = InformationData::X_POSITION
  Y_POSITION = InformationData::Y_POSITION

  def land(planet, position, orientation)
    @planet = planet
    @current_position= [position[X_POSITION],position[Y_POSITION]]
    @current_orientation = orientation
  end

  def broadcast_position
    obtain_current_position
  end

  def obtain_current_position
    [@current_position[X_POSITION], @current_position[Y_POSITION]]
  end

  def broadcast_orientation
    @current_orientation
  end

  def recieve_command(command_message)
    move_forward if command_message == :F
    move_backward if command_message == :B
    turn RIGHT if command_message == :R
    turn LEFT if command_message == :L
    broadcast_position if command_message == :P
    broadcast_orientation if command_message == :O
  end

  def move_forward
    take_one_step_forward unless @planet.at_the_edge?(@current_position, @current_orientation)
    do_a_barrel_roll if @planet.at_the_edge?(@current_position, @current_orientation)
  end

  def move_backward
    turn RIGHT
    turn RIGHT
    move_forward
  end

  def take_one_step_forward
     @current_position[DIRECTION[@current_orientation]] += 1
  end

  def turn(side)
    @current_orientation = side[@current_orientation]
  end

  def do_a_barrel_roll # Totally random name
    if @current_orientation == :EAST
      @current_position[Y_POSITION] = 0
    elsif @current_orientation == :WEST
      @current_position[Y_POSITION] = @planet.number_of_columns - 1
    elsif @current_orientation == :SOUTH
      @current_position[X_POSITION] = 0
    elsif @current_orientation == :NORTH
      @current_position[X_POSITION] = @planet.number_of_rows - 1
    end
  end
end
