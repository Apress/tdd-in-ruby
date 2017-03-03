require 'minitest/autorun'

class Calculator  
  def add(addend, augend)
    addend + augend
  end
end

class TestCaculator < Minitest::Test
  def test_addition
    calculator = Calculator.new
    result = calculator.add(1, 2)
    assert_equal 3, result
  end
end
