require 'minitest/autorun'
require_relative 'fibonacci'

class TestFibonacci < Minitest::Test
  def test_fibonacci_of_zero_is_zero
    result = Fibonacci.of(0)
    assert_equal 0, result
  end
  def test_fibonacci_of_one_is_one
    result = Fibonacci.of(1)
    assert_equal 1, result
  end
  def test_fibonacci_of_two_is_one
    result = Fibonacci.of(2)
    assert_equal 1, result
  end
  def test_fibonacci_of_three_is_two
    result = Fibonacci.of(3)
    assert_equal 2, result
  end

  def test_fibonacci_of_four_is_three
    result = Fibonacci.of(4)
    assert_equal 3, result
   end
  def test_fibonacci_of_five_is_five
    result = Fibonacci.of(5)
    assert_equal 5, result
  end
  def test_fibonacci_of_ten_is_fifty_five
    result = Fibonacci.of(10)
    assert_equal 55, result
  end
end
