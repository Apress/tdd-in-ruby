require_relative 'fizz_buzz_engine'

class FizzBuzz  
  def sequence
    numbers.collect do |n|
      fbe = FizzBuzzEngine.new(n)
      fbe.value
    end
  end

  private

  def numbers
    (1..100).to_a
  end  
end
