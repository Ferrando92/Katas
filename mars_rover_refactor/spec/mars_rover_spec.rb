require './mars_rover'
describe MarsRover, '#first movements' do
  INNITIAL_POSITION = [0, 0]
  INNITIAL_ORIENTATION = :EAST
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
      @mars_rover.command(:F)
      expect(@mars_rover.broadcast_position).to eq([0, 1])
    end
    it 'the rover moves backward' do
      @mars_rover.command(:B)
      expect(@mars_rover.broadcast_position).to eq([0, LAST_EAST_POSITION_Y])
    end
    it 'the rover turns left' do
      @mars_rover.command(:L)
      expect(@mars_rover.broadcast_orientation).to eq(:NORTH)
    end
    it 'the rover turns right' do
      @mars_rover.command(:R)
      expect(@mars_rover.broadcast_orientation).to eq(:SOUTH)
    end
  end

  context 'Trying to make some more tricky moves sending commands, using the table like a reference not the rover' do
    it 'the rover moves up' do
      @mars_rover.command(:L)
      @mars_rover.command(:F)
      expect(@mars_rover.broadcast_position).to eq([49,0])
    end
    it 'the rover moves down' do
      @mars_rover.command(:R)
      @mars_rover.command(:F)
      expect(@mars_rover.broadcast_position).to eq([1,0])
    end
    it 'the rover moves to the left' do
      @mars_rover.command(:L)
      @mars_rover.command(:L)
      @mars_rover.command(:F)
      expect(@mars_rover.broadcast_position).to eq([0,49])
    end
    it 'the rover moves to the right' do
      @mars_rover.command(:F)
      expect(@mars_rover.broadcast_position).to eq([0,1])
    end
  end
end
