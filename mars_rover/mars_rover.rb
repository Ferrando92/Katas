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
    @actual_position_y += 1
  end

  def move_backward
    @actual_position_y -= 1
    @actual_position_y = @plannet[@actual_position_x].length - 1
  end
end
