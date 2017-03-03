require 'minitest/autorun'
require_relative 'fizz_buzz_generator'
require_relative 'fizz'
require_relative 'buzz'
require_relative 'fizz_buzz'
require_relative 'no_fizz_buzz'

class TestFizzBuzzGenerator < Minitest::Test
  def test_fizz_buzz_sequence
    objects = [FizzBuzz.new, Fizz.new, Buzz.new, NoFizzBuzz.new]
    g = FizzBuzzGenerator.new(objects, (1..20).to_a)
    result = g.generate
    expected = [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"]

    assert_equal expected, result
  end
  
  def test_no_fizz_buzz_sequence
    fb = NoFizzBuzz.new
    result = fb.value(1, ->{})

    assert_equal 1, result
  end
  
end
