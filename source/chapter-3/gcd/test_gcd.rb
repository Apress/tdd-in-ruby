require 'minitest/autorun'
require_relative 'gcd'

describe 'Gcd' do  
  it 'should return 4 for 8 and 12' do
    gcd = Gcd.new(8,12)
    result = gcd.calculate

    assert_equal 4, result  
  end

  it 'should return 6 for 54 and 24' do
    gcd = Gcd.new(24,54)
    result = gcd.calculate

    assert_equal 6, result
  end

  it 'should return 6 for 12,30' do
    gcd = Gcd.new(12,30)
    result = gcd.calculate

    assert_equal 6, result
  end
end
