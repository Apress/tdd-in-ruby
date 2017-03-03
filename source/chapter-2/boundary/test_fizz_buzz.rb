require 'minitest/autorun'
require_relative 'fizz_buzz'

class TestFizzBuzz < Minitest::Test
  def test_print_fizz_for_multiples_of_3
    fb = FizzBuzz.new

    assert_output('Fizz') { fb.output(3) }
  end
end
