require 'minitest/autorun'

class Grass
  attr_reader :color

  def initialize
    @color = 'green'
  end  
end

describe Grass do
  it 'is green' do
    grass = Grass.new
    result = grass.color
    assert_equal 'green', result
  end
end

grass = Grass.new
if grass.color == 'green'
  puts "Well maintained lawn"
else
  puts "Grass is brown"
end
