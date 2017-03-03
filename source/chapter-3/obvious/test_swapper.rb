require 'minitest/autorun'

class Swapper
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end  

  def swap
    @a, @b = @b, @a
  end
end

class TestSwapper < Minitest::Test
  def test_swap
    swapper = Swapper.new(1, 2)
    swapper.swap
    assert_equal 2, swapper.a
    assert_equal 1, swapper.b
  end
  def test_no_swap
    swapper = Swapper.new(1, 2)

    assert_equal 1, swapper.a
    assert_equal 2, swapper.b
  end
end
