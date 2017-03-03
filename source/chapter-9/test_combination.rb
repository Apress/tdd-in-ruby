require 'minitest/autorun'
require_relative 'pair_rank'

class CombinationTest < Minitest::Test
  include PairRank

  def test_get_first_pair_given_options
    options = ['A', 'B', 'C']
    c = Combination.new(options)
    result = c.pair
    assert_equal ['A', 'B'], result
  end

  def test_get_second_pair_given_options
    options = ['A', 'B', 'C']
    c = Combination.new(options)
    c.pair
    result = c.pair
    assert_equal ['A', 'C'], result
  end

  def test_get_third_pair_given_options
    options = ['A', 'B', 'C']
    c = Combination.new(options)
    c.pair
    c.pair
    result = c.pair
    assert_equal ['B', 'C'], result
  end

  def test_get_pair_when_there_is_no_pair
    options = ['A', 'B', 'C']
    c = Combination.new(options)
    c.pair
    c.pair
    c.pair
    result = c.pair
    assert_equal nil, result
  end
end
