require 'minitest/autorun'
require_relative 'fizz_buzz'
require_relative 'virtual_clock'

class TestFizzBuzz < Minitest::Test

  def test_generate_fizz_morning_for_mornings
    clock = VirtualClock.new
    clock.hour = 10
    fb = FizzBuzz.new nil, clock
    result = fb.transform(3)

    assert_equal 'Fizz Morning', result    
  end

  def test_generate_fizz_for_not_morning
    clock = VirtualClock.new
    clock.hour = 14
    fb = FizzBuzz.new nil, clock
    result = fb.transform(3)

    assert_equal 'Fizz', result    
  end

end


