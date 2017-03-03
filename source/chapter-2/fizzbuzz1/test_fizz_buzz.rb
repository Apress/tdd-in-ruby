require 'minitest/autorun'
require_relative 'fizz_buzz'

class TestFizzBuzz < Minitest::Test
  def test_generate_fizz_for_multiples_of_3
    fb = FizzBuzz.new
    result = fb.sequence
    assert_equal 'Fizz', result[2]
  end

  def test_generate_buzz_for_multiples_of_5
    fb = FizzBuzz.new
    result = fb.sequence
    assert_equal 'Buzz', result[4]
  end

  def test_generate_fizzbuzz_for_multiples_of_3_and_5
    fb = FizzBuzz.new
    result = fb.sequence
    assert_equal 'FizzBuzz', result[14]
  end

end
