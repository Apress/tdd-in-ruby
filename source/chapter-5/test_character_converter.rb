require 'minitest/autorun'
require_relative 'character_converter'

describe CharacterConverter do
  it "should convert '0' to 0" do
    cc = CharacterConverter.new('0')
    result = cc.to_i
    assert_equal 0, result
  end

  it "should convert '1' to 1" do 
    cc = CharacterConverter.new('1')
    result = cc.to_i
    assert_equal 1, result    
  end

  it "should convert '10' to 10" do
    cc = CharacterConverter.new('10')
    result = cc.to_i
    assert_equal 10, result    
  end
  
  it "should convert '1984' to 1984" do
    cc = CharacterConverter.new('1984')
    result = cc.to_i
    assert_equal 1984, result
  end
  
end