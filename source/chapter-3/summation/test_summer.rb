require 'minitest/autorun'
require_relative 'summer'

class TestSum < Minitest::Test
  def test_sum_list_of_numbers_with_no_elements
    summer = Summer.new
    result = summer.sum([])
    assert_equal 0, result
  end  
  
  def test_sum_list_of_numbers_with_one_element
    summer = Summer.new
    result = summer.sum([1])
    assert_equal 1, result    
  end

  def test_sum_list_of_numbers_with_two_elements
    summer = Summer.new
    result = summer.sum([1,1])
    assert_equal 2, result
  end

  def test_sum_list_of_numbers_with_5_elements
    summer = Summer.new
    result = summer.sum([1,2,3,4,5])
    assert_equal 15, result
  end
end


