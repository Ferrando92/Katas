class MarsRover
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

  def receive_command(command)
    move_forward if command == :F
    move_backward if command == :B
  end

  def move_forward
     take_one_step_forward if !is_at_the_edge?(:forward)
     do_a_barrel_roll(:forward) if is_at_the_edge?(:forward)
  end

  def move_backward
     take_one_step_backward if !is_at_the_edge?(:backward)
     do_a_barrel_roll(:backward) if is_at_the_edge?(:backward)
  end

  def is_at_the_edge?(command)
    if command == :forward
      @actual_position_y == @plannet[@actual_position_x].length - 1
    elsif command == :backward
      @actual_position_y == 0
    end
  end

  def take_one_step_forward
    @actual_position_y += 1
  end

  def take_one_step_backward
    @actual_position_y -= 1
  end

  def do_a_barrel_roll(command) # Totally random name
    if command == :forward
      @actual_position_y = 0
    elsif command == :backward
      @actual_position_y = @plannet[@actual_position_x].length - 1
    end
  end
end
