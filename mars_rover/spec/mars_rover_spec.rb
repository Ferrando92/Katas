require './mars_rover'
describe MarsRover, '#first movements'  do
  context 'The rover just landed' do
    it 'the rover is in the position [0,0]' do
      INNITIAL_POSITION = [0,0]
      INNITIAL_ORIENTATION = [:north]
      mars_rover = MarsRover.new(INNITIAL_POSITION, INNITIAL_ORIENTATION)
      expect(mars_rover.broadcast_position).to eq(INNITIAL_POSITION)
      expect(mars_rover.broadcast_orientation).to eq(INNITIAL_ORIENTATION)
    end
  end
end
