require 'minitest/autorun'
require_relative 'stack'

module Minitest::Assertions
  def assert_push(stack)
    assert_equal 1, stack.size
    assert_equal 2, stack.top    
  end  
end

class TestStack < Minitest::Test
  def test_should_push_a_given_item
    stack = Stack.new
    stack.push(2)
    
    assert_push(stack)
  end
end
