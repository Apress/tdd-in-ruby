class Location
  NORTHWEST = [-1, 1]
  NORTHEAST = [1, 1]
  SOUTHWEST = [-1, -1]
  SOUTHEAST = [1, -1]
  CENTER    = [0, 0]
  NORTH     = [0, 1]
  SOUTH     = [0, -1]
  EAST      = [1, 0]
  WEST      = [-1, 0]

  OFFSETS = [NORTHWEST, NORTHEAST, SOUTHWEST, SOUTHEAST, NORTH, SOUTH, EAST, WEST]

  def self.add(first, second)
    [first[0]+second[0], first[1]+second[1]]
  end
end
