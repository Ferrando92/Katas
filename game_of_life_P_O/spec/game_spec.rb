class Cell
  def next_gen(number_of_cells_arround)
    number_of_cells_arround == 3 ? Alive.new : Dead.new
  end
end

class Alive < Cell
  def next_gen(number_of_cells_arround)
    number_of_cells_arround == 2 ? Alive.new : super
  end
end

class Dead < Cell
end

describe Cell, 'Apply GameOfLife Rules' do


  before :each do
    
  end
  

  context 'Alive cell aplying the rules ' do
  
    it 'Has 1 neighbour, and must return a Dead cell' do
     expect(Dead.new.class).to eq((Alive.new).next_gen(1).class)
    end

    it 'Has 4 neighbour, and must return a Dead cell' do
     expect(Dead.new.class).to eq((Alive.new).next_gen(4).class)
    end

    it 'Has 3 neighbour, and must return an Alive cell' do
     expect(Alive.new.class).to eq((Alive.new).next_gen(3).class)
    end

    it 'Has 2 neighbour, and must return an Alive cell' do
     expect(Alive.new.class).to eq((Alive.new).next_gen(2).class)
    end

  end

    context 'Dead cell aplying the rules ' do
  
    it 'Has 1 neighbour, and must return a Dead cell' do
     expect(Dead.new.class).to eq((Dead.new).next_gen(1).class)
    end

    it 'Has 4 neighbour, and must return a Dead cell' do
     expect(Dead.new.class).to eq((Dead.new).next_gen(4).class)
    end

    it 'Has 3 neighbour, and must return an Alive cell' do
     expect(Alive.new.class).to eq((Dead.new).next_gen(3).class)
    end

    it 'Has 2 neighbour, and must return a Dead cell' do
     expect(Dead.new.class).to eq((Dead.new).next_gen(2).class)
    end

  end
end
