class MarsRover
  TURNS_RIGHT_MAPPING = {:NORTH => :EAST , :EAST=> :SOUTH, :SOUTH=> :WEST, :WEST=> :NORTH}
  TURNS_LEFT_MAPPING = {:NORTH => :WEST , :EAST=> :NORTH, :SOUTH=> :EAST, :WEST=> :SOUTH}
  def land(plannet, position, orientation)
    @plannet = plannet
    @actual_position_x = position[0]
    @actual_position_y = position[1]
    @actual_orientation = orientation
  end

  def broadcast_position
    obtain_actual_position
  end

  def obtain_actual_position
    [@actual_position_x, @actual_position_y]
  end

  def broadcast_orientation
    @actual_orientation
  end

  def command(command_message)
    move_forward if command_message == 'F'
    move_backward if command_message == 'B'
    turn_right if command_message == 'R'
    turn_left if command_message == 'L'
    broadcast_position if command_message == 'P'
    broadcast_orientation if command_message == 'O'
  end

  def move_forward
     take_one_step_forward if !is_at_the_edge?
     do_a_barrel_roll if is_at_the_edge?
  end

  def move_backward
    turn_right
    turn_right
    move_forward
  end

  def is_at_the_edge?# switch?
    if @actual_orientation == :EAST
      @actual_position_y == @plannet[@actual_position_x].length - 1
    elsif @actual_orientation == :WEST
      @actual_position_y == 0
    elsif @actual_orientation == :SOUTH
      @actual_position_x == @plannet.length - 1
    elsif @actual_orientation == :NORTH
      @actual_position_x == 0
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

  def turn_left
    @actual_orientation = TURNS_LEFT_MAPPING[@actual_orientation]
  end

  def turn_right
    @actual_orientation = TURNS_RIGHT_MAPPING[@actual_orientation]
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

def main
  @rover = MarsRover.new
  @plannet = Array.new(50, Array.new(50))
  @rover.land(@plannet, [0,0], :EAST)
  @terminal = 'START'
  until @terminal == "EXIT" do
    puts 'Rover is online and waiting for comands'
    @terminal = gets.to_s
    puts @rover.command(@terminal)
  end
end
main

