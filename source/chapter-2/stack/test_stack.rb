require 'minitest/autorun'
require_relative 'stack'

class TestStack < Minitest::Test  
  def test_should_push_a_given_item
    stack = Stack.new
    stack.push(2)
    assert_equal 1, stack.size
    assert_equal 2, stack.top
  end
    
  def test_should_pop_a_given_item
    stack = Stack.new
    stack.push(2)
    result = stack.pop
    assert_equal 2, result
    assert_equal 0, stack.size
  end
    
  def test_stack_should_be_empty_on_construction
    stack = Stack.new

    assert stack.empty?
  end  
  
  def test_after_n_pushes_to_an_empty_stack_the_stack_is_not_empty
    stack = Stack.new
    stack.push(2)
    stack.push(4)

    refute stack.empty?
  end
    
  def test_after_n_pushes_to_an_empty_stack_stack_its_size_is_n
    stack = Stack.new
    stack.push(2)
    stack.push(4)

    assert_equal 2, stack.size
  end
  
  def test_stack_with_n_elements_becomes_empty_after_n_pops
    stack = Stack.new
    stack.push(2)
    stack.push(4)

    stack.pop
    stack.pop

    assert stack.empty?
  end

  def test_popping_from_an_empty_stack_throws_an_exception
    stack = Stack.new

    assert_raises do
      stack.pop
    end
  end
    
end
