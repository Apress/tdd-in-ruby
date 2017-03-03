require_relative 'erastostenes'
require 'prime'

class PrimeFactor
  def initialize(number)
    @number = number
  end  

  def calculate
    result = []
    current_prime = 2
    until Prime.prime?(@number)
      if (@number % current_prime) == 0
        result << current_prime
        @number = @number / current_prime
      else
        current_prime = Erastostenes.next(current_prime)
      end
    end
    result << @number
    result
  end

end


