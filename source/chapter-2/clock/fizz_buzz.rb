require_relative 'fixnum_extensions'

class FizzBuzz
  using FixnumExtensions

  def initialize(output=$stdout, clock)
    @output = output
    @clock = clock
  end

  def transform(n)
    result = sequence[n-1]
    if @clock && @clock.morning?
     result = "#{result} Morning"
    end
    result
  end    

  def sequence
    numbers.collect do |n|
      n.fizz_buzz
    end
  end

  def output(n)
    result = transform(n)

    print result
  end

  private

  def numbers
    (1..100).to_a
  end  
end

