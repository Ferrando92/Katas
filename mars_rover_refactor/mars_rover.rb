class MarsRover
  X_POSITION = 0
  Y_POSITION = 1
  TURNS_RIGHT_MAPPING = { NORTH: :EAST , EAST: :SOUTH, SOUTH: :WEST, WEST: :NORTH }
  TURNS_LEFT_MAPPING = { NORTH: :WEST , EAST: :NORTH, SOUTH: :EAST, WEST: :SOUTH }
  STEP_FORWARD_MAPPING = { NORTH: X_POSITION, EAST: Y_POSITION, SOUTH: X_POSITION, WEST: Y_POSITION }
  RIGHT = TURNS_RIGHT_MAPPING
  LEFT = TURNS_LEFT_MAPPING
  def land(plannet, position, orientation)
    @plannet = plannet
    # REFACTOR
    # @actual_position[X_POSITION] = position[0]
    # @actual_position[Y_POSITION] = position[1]

    @actual_position_x = position[0]
    @actual_position_y = position[1]
    @actual_orientation = orientation
  end

  def broadcast_position
    obtain_actual_position
  end

  def obtain_actual_position
    # [@actual_position[X_POSITION], @actual_position[Y]]
    [@actual_position_x, @actual_position_y]
  end

  def broadcast_orientation
    @actual_orientation
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
    take_one_step_forward unless at_the_edge?
    do_a_barrel_roll if at_the_edge?
  end

  def move_backward
    turn RIGHT
    turn RIGHT
    move_forward
  end

  def at_the_edge?# switch?
    if @actual_orientation == :EAST
      @actual_position_y == @plannet[@actual_position_x].length - 1
      # @actual_position[Y_POSITION] == @plannet[@actual_position[X_POSITION]].length - 1
    elsif @actual_orientation == :WEST
      @actual_position_y.zero?
      #  @actual_position[Y_POSITION] == 0
    elsif @actual_orientation == :SOUTH
      @actual_position_x == @plannet.length - 1
      # @actual_position[X_POSITION]== @plannet.length - 1
    elsif @actual_orientation == :NORTH
      @actual_position_x.zero?
      # @actual_position[X_POSITION] == 0
    end
  end

  def take_one_step_forward
    if @actual_orientation == :NORTH
      @actual_position_x += 1
    elsif @actual_orientation == :SOUTH
      @actual_position_x += 1
    elsif @actual_orientation == :WEST
      @actual_position_y += 1
    elsif @actual_orientation == :EAST
      @actual_position_y += 1
    end
  end

  def take_one_step_forward_refactored
     @actual_position[STEP_FORWARD_MAPPING[@actual_orientation]] += 1
  end

  def turn(side)
    @actual_orientation = side[@actual_orientation]
  end

  def do_a_barrel_roll # Totally random name, SWITCH?
    if @actual_orientation == :EAST
      @actual_position_y = 0
    elsif @actual_orientation == :WEST
      @actual_position_y = @plannet[@actual_position_x].length - 1
    elsif @actual_orientation == :SOUTH
      @actual_position_x = 0
    elsif @actual_orientation == :NORTH
      @actual_position_x = @plannet.length - 1
    end
  end
end
