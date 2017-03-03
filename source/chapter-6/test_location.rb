require 'minitest/autorun'
require_relative 'location'

describe Location do
  it 'NorthWest is located at (-1, 1)' do
    assert_equal [-1, 1], Location::NORTHWEST
  end
  it 'NorthEast is located at (1, 1)' do
    assert_equal [1, 1], Location::NORTHEAST
  end
  it 'SouthWest is located at (-1, -1)' do
    assert_equal [-1, -1], Location::SOUTHWEST
  end
  it 'SouthEast is located at (1, -1)' do
    assert_equal [1, -1], Location::SOUTHEAST
  end
  it 'Center is located at (0, 0)' do
    assert_equal [0, 0], Location::CENTER
  end
  it 'North is located at (0, 1)' do
    assert_equal [0, 1], Location::NORTH
  end
  it 'South is located at (0, -1)' do
    assert_equal [0, -1], Location::SOUTH
  end
  it 'East is located at (1, 0)' do
    assert_equal [1, 0], Location::EAST
  end
  it 'West is located at (-1, 0)' do
    assert_equal [-1, 0], Location::WEST
  end
  
  it 'adding two locations returns a new location' do
    result = Location.add(Location::SOUTH, Location::CENTER)

    assert_equal Location::SOUTH, result
  end
  it 'returns a list of offsets for any cell' do
    offsets = Location::OFFSETS
    expected = [Location::NORTHWEST, Location::NORTHEAST, 
      Location::SOUTHWEST, Location::SOUTHEAST, Location::NORTH, 
      Location::SOUTH, Location::EAST, Location::WEST]

    assert_equal expected, offsets
  end
  
end
