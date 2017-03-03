require 'minitest/autorun'
require_relative 'fizz_buzz'

class TestFizzBuzz < Minitest::Test  
  def test_generate_fizz_for_multiples_of_3
    fb = FizzBuzz.new
    result = fb.transform(3)
    assert_equal 'Fizz', result
  end
  
  def test_generate_buzz_for_multiples_of_5
    fb = FizzBuzz.new
    result = fb.transform(5)
    assert_equal 'Buzz', result
  end
  
  def test_generate_fizzbuzz_for_multiples_of_15
    fb = FizzBuzz.new
    result = fb.transform(15)
    assert_equal 'FizzBuzz', result
  end

  def test_generate_number_is_not_multiple
    fb = FizzBuzz.new
    result = fb.transform(1)
    assert_equal 1, result
  end
  
end


