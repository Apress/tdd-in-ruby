class FizzBuzz
  def sequence
    numbers.collect do |n|
      if (multiple_of(3, n) and multiple_of(5, n))
        'FizzBuzz'
      elsif multiple_of(3, n)
        'Fizz'
      elsif multiple_of(5, n)
        'Buzz'
      end
    end
  end

  private

  def multiple_of(divisor, number)
    number.modulo(divisor).zero?
  end

  def numbers
    (1..100).to_a
  end

end

