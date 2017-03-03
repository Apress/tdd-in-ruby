require 'minitest/autorun'  
require_relative 'calculator'  

class TestCalculator < Minitest::Test
  def test_addition
    calculator = Calculator.new
    result = calculator.add(1,2)
    assert_equal 3, result
  end

  def test_subtraction
    calculator = Calculator.new
    result = calculator.subtract(3,2)
    assert_equal 1, result    
  end
end