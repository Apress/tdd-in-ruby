require 'minitest/autorun'
require_relative 'cell'
require_relative 'location'
require_relative 'neighborhood'

describe NeighborHood do
  
  it 'neighborhood with one alive cell will die in the next generation' do
    cell = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    neighborhood = NeighborHood.new
    neighborhood.seed([cell, c2])

    neighborhood.tick

    assert cell.dead?, 'Cell is still alive'
  end

  it 'a cell with two alive cells as neighbors will stay alive in the next generation' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1,c2, c3])

    neighborhood.tick

    assert c1.alive?
  end
  
  it 'number of neighbors is 0 for a cell that is lonely' do
    c1 = Cell.new(Location::CENTER)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1])

    assert_equal 0, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 1 for a cell that has a neighbor in north' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2])

    assert_equal 1, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 2 for a cell that has a neighbor in north and south' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3])

    assert_equal 2, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 2 for a north west cell that has a neighbor in north and west' do
    c1 = Cell.new(Location::NORTHWEST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::WEST)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3])

    assert_equal 2, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 8 for a center cell that has a neighbor in all locations' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    c4 = Cell.new(Location::EAST)
    c5 = Cell.new(Location::WEST)
    c6 = Cell.new(Location::NORTHWEST)
    c7 = Cell.new(Location::NORTHEAST)
    c8 = Cell.new(Location::SOUTHWEST)
    c9 = Cell.new(Location::SOUTHEAST)

    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4, c5, c6, c7, c8, c9])

    assert_equal 8, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 3 for a north west cell that has a neighbor in north, west and center' do
    c1 = Cell.new(Location::NORTHWEST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::WEST)
    c4 = Cell.new(Location::CENTER)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4])

    assert_equal 3, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 3 for a north east cell that has a neighbor in north, east and center' do
    c1 = Cell.new(Location::NORTHEAST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::EAST)
    c4 = Cell.new(Location::CENTER)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4])

    assert_equal 3, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'number of neighbors is 3 for a south west cell that has a neighbor in east, center and south' do
    c1 = Cell.new(Location::SOUTHWEST)
    c2 = Cell.new(Location::SOUTH)
    c3 = Cell.new(Location::WEST)
    c4 = Cell.new(Location::CENTER)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4])

    assert_equal 3, neighborhood.number_of_neighbors_for(c1)
  end
  
  it 'a cell with 4 alive cells will die of overcrowding' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::NORTHWEST)
    c4 = Cell.new(Location::WEST)
    c5 = Cell.new(Location::SOUTHWEST)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4, c5])

    neighborhood.tick

    assert c1.dead?    
  end
  
  it 'a dead cell with three alive cells as neighbors will be born in the next generation' do
    c1 = Cell.new(Location::CENTER)
    c1.die
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::NORTHWEST)
    c4 = Cell.new(Location::NORTHEAST)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4])

    neighborhood.tick

    assert c1.alive?
  end
  
  it 'a cell with three alive cells as neighbors will stay alive in the next generation' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    c4 = Cell.new(Location::EAST)
    neighborhood = NeighborHood.new
    neighborhood.seed([c1, c2, c3, c4])

    neighborhood.tick

    assert c1.alive?
  end
  
end
