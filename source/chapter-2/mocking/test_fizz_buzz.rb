require 'minitest/autorun'
require_relative 'fizz_buzz'

class TestFizzBuzz < Minitest::Test
  def test_write_fizz_for_multiples_of_3
    mock = MiniTest::Mock.new
    mock.expect(:write, nil, ['Fizz'])

    fb = FizzBuzz.new(mock)
    fb.output(3)

    mock.verify
  end

end


