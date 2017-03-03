require 'minitest/autorun'

class Calculator  
  def add(addend, augend)
    addend + augend
  end
end

class TestCaculator < Minitest::Test
  def test_addition_of_1_and_2_is_3
    calculator = Calculator.new
    result = calculator.add(1, 2)
    assert_equal 3, result
  end
  
  def test_addition_of_2_and_2_is_4
    calculator = Calculator.new
    result = calculator.add(2, 2)
    assert_equal 4, result
  end
  
end
