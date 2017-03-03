class Gcd
  def initialize(x, y)
    @x = x
    @y = y
    initialize_numbers
  end

  def initialize_numbers
    if @x > @y 
      @bigger_number = @x
      @smaller_number = @y
    else
      @bigger_number = @y
      @smaller_number = @x      
    end
  end

  def calculate
    remainder = 1
    dividend = @bigger_number
    divisor = @smaller_number  
    until remainder == 0
      remainder = dividend % divisor
      dividend = divisor
      divisor = remainder
    end
    dividend
  end
end
