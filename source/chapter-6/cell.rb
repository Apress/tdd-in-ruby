class Cell
  attr_reader :location

  def initialize(location)
    @alive = true
    @location = location
  end  

  def alive?
    @alive == true
  end

  def die
    @alive = false
  end

  def dead?
    !alive?
  end

  def born
    @alive = true
  end

  def at?(location)
    @location == location
  end
end