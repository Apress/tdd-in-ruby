require 'minitest/autorun'
require_relative 'my_counter'

describe MyCounter do
  it 'should return 0 for n = 0 and an empty list' do
    counter = MyCounter.new
    result = counter.count(0, [])
    assert_equal 0, result
  end
  
  it 'should return 1 for 0, [0]' do
    counter = MyCounter.new
    result = counter.count(0, [0])
    assert_equal 1, result    
  end
  
  it 'should return 0 for 1, [0]' do
    counter = MyCounter.new
    result = counter.count(1, [0])
    assert_equal 0, result    
  end
  
  it 'should return 2 for element 1 in [1,1]' do
    counter = MyCounter.new
    result = counter.count(1, [1,1])
    assert_equal 2, result    
  end
  
  it "should return 5 for element 3 in list [1,1,2,3,4,3,6,6,1]" do
    counter = MyCounter.new
    result = counter.count(3, [1,1,2,3,4,3,6,6,1])
    assert_equal 5, result    
  end
  
end
