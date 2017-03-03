require_relative 'fixnum_extensions'

class FizzBuzz
  using FixnumExtensions

  def initialize(output = $stdout)
    @output = output
  end

  def sequence
    numbers.collect do |n|
      n.fizz_buzz
    end
  end

  def transform(n)
    sequence[n-1]
  end

  def output(n)
    result = transform(n)
    @output.write result
  end

  private

  def numbers
    (1..100).to_a
  end  
end

