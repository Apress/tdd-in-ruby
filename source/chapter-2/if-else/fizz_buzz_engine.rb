class FizzBuzzEngine
  def initialize(number)
    @number = number
  end

  def value
    return 'FizzBuzz' if multiple_of(15)
    return 'Fizz' if multiple_of(3)
    return 'Buzz' if multiple_of(5)
    @number
  end

  private

  def multiple_of(divisor)
    @number.modulo(divisor).zero?
  end
end
