require 'minitest/autorun'
require_relative 'prime_factor'

describe PrimeFactor do
  it 'should return 2 for input of 2' do
    prime_factorial = PrimeFactor.new(2)
    result = prime_factorial.calculate
    assert_equal [2], result
  end
  
  it 'should return [2,2] for input of 4' do
    prime_factorial = PrimeFactor.new(4)
    result = prime_factorial.calculate
    assert_equal [2,2], result
  end

  it 'should return 3 for input of 3' do
    prime_factorial = PrimeFactor.new(3)
    result = prime_factorial.calculate
    assert_equal [3], result
  end

  it 'should return [3,7,7] for input of 147' do
    prime_factorial = PrimeFactor.new(147)
    result = prime_factorial.calculate
    assert_equal [3,7,7], result 
  end

  it 'should handle any number' do
    prime_factorial = PrimeFactor.new(168)
    result = prime_factorial.calculate
    assert_equal [2, 2, 2, 3, 7], result 
  end
  
end


