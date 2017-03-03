require 'minitest/autorun'
require_relative 'erastostenes'


describe Erastostenes do
  it 'makes a list of all integers <= 30 and greater than 1' do
    e = Erastostenes.new(30)
    result = e.number_list
    expected = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    assert_equal expected, result
  end

  it 'should calculate the prime numbers for 30' do
    e = Erastostenes.new(30)
    result = e.calculate
    expected = [2,3,5,7,11,13,17,19,23,29]
    assert_equal expected, result
  end
end
