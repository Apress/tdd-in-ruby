require 'minitest/autorun'
require_relative 'cell'
require_relative 'location'

describe Cell do
  it 'is alive when it is created' do
    cell = Cell.new(Location::CENTER)

    assert cell.alive?
  end
  it 'can transition to dead state' do
    cell = Cell.new(Location::CENTER)
    cell.die
    refute cell.alive?
  end  

  it 'dead cell can be born again' do
    cell = Cell.new(Location::CENTER)
    cell.die

    cell.born

    assert cell.alive?
  end
  
  it 'returns true if a cell is located in the specified location' do
    cell = Cell.new(Location::CENTER)
    result = cell.at?(Location::CENTER)

    assert result
  end

  it 'returns false if a cell is not located in the specified location' do
    cell = Cell.new(Location::CENTER)
    result = cell.at?(Location::NORTH)

    refute result
  end
  
end
