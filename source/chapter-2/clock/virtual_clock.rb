class VirtualClock
  attr_accessor :hour

  def morning?
    hour <= 12
  end
end
