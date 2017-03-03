require 'minitest/autorun'

class Grass  
  def initialize
    @color = 'green'
  end  

  def green?
    @color == 'green'
  end
end

describe Grass do
  it 'is green' do
    grass = Grass.new
    result = grass.green?
    assert result
  end
end

grass = Grass.new
if grass.green?
  puts "Well maintained lawn"
else
  puts "Grass is brown"
end
