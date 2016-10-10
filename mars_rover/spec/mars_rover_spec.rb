require './mars_rover'
describe MarsRover, '#first movements' do
  INNITIAL_POSITION = [0, 0]
  INNITIAL_ORIENTATION = [:E]
  LAST_EAST_POSITION_Y = 49
  LAST_WEST_POSITION_Y = 0
  LAST_SOUTH_POSITION_X = 49
  LAST_NORTH_POSITION_X = 0

  before :each do
    @mars_rover = MarsRover.new
    @plannet = Array.new(LAST_SOUTH_POSITION_X + 1, Array.new(LAST_EAST_POSITION_Y + 1))
    @mars_rover.land(@plannet, INNITIAL_POSITION, INNITIAL_ORIENTATION)
  end

  context 'The rover just landed' do
    it 'the rover is in the position [0, 0]' do
      expect(@mars_rover.broadcast_position).to eq(INNITIAL_POSITION)
    end
    it 'the rover is oriented to East' do
      expect(@mars_rover.broadcast_orientation).to eq(INNITIAL_ORIENTATION)
    end
  end

  context 'Trying to make some simple moves sending commands' do
    it 'the rover moves forward' do
      @mars_rover.receive_command(:F)
      expect(@mars_rover.broadcast_position).to eq([0, 1])
    end
    it 'the rover moves backward' do
      @mars_rover.receive_command(:B)
      expect(@mars_rover.broadcast_position).to eq([0, LAST_EAST_POSITION_Y])
    end
  end

  context 'Trying to make some more tricky moves sending commands' do
    it 'the rover moves up' do
      # expect(@mars_rover.broadcast_position).to eq()
    end
    it 'the rover moves down' do
      # expect(@mars_rover.broadcast_orientation).to eq(INNITIAL_ORIENTATION)
    end
    it 'the rover moves left' do
      # expect(@mars_rover.broadcast_orientation).to eq(INNITIAL_ORIENTATION)
    end
    it 'the rover moves right' do
      # expect(@mars_rover.broadcast_orientation).to eq(INNITIAL_ORIENTATION)
    end
  end
end
