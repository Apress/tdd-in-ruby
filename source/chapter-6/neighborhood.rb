
class NeighborHood 
  def initialize
    @grid = []
  end

  def tick
    @grid.each do |cell|
      lonely_or_over_crowded_cells_die(cell)
      reproduction_of(cell)
    end         
  end

  def seed(cells)
    @grid = cells  
  end

  def number_of_neighbors_for(cell)
    size = 0
    offsets = Location::OFFSETS
    offsets.each do |offset|
      size = count_cell(cell, offset, size)  
    end    
    size
  end

  private  

  def count_cell(original, offset, size)
    neighbor = find_neighbor_cell(original, offset)
    size += 1 if neighbor
    size
  end

  def find_neighbor_cell(original, offset)
    neighbor_location = Location.add(original.location, offset)
    @grid.detect{|cell| cell.at?(neighbor_location)}
  end

  def lonely_or_over_crowded_cells_die(cell)
    neighbors_count = number_of_neighbors_for(cell)
    if neighbors_count != 2 or neighbors_count == 3
      cell.die
    end
  end

  def reproduction_of(cell)
    neighbors_count = number_of_neighbors_for(cell)
    if cell.dead? and neighbors_count == 3
      cell.born
    end
  end
end