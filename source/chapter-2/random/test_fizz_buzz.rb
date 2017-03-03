require 'minitest/autorun'
require_relative 'fizz_buzz'

class TestFizzBuzz < Minitest::Test

  def test_generate_random_number_between_1_and_100_inclusive
    fb = FizzBuzz.new
    result = fb.random

    assert_includes (1..100).to_a, result
  end

end


