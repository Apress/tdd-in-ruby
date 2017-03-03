require 'minitest/autorun'
require_relative "gilded_rose"

class CharacterizationTest < Minitest::Test
  def setup
    @rose = GildedRose.new
    @items = @rose.instance_variable_get(:@items)
  end

  attr_reader :rose, :items

  def test_after_1_day
    rose.update_quality
    assert_items([9, 19], [1, 1], [4, 6], [0, 80], [14, 21], [2, 5])
  end

  def test_after_2_days
    2.times { rose.update_quality }
    assert_items([8, 18], [0, 2], [3, 5], [0, 80], [13, 22], [1, 4])
  end

  def test_after_3_days
    3.times { rose.update_quality }
    assert_items([7, 17], [-1, 4], [2, 4], [0, 80], [12, 23], [0, 3])
  end

  def test_after_4_days
    4.times { rose.update_quality }
    assert_items([6, 16], [-2, 6], [1, 3], [0, 80], [11, 24], [-1, 1])
  end

  def test_after_5_days
    5.times { rose.update_quality }
    assert_items([5, 15], [-3, 8], [0, 2], [0, 80], [10, 25], [-2, 0])
  end

  def test_after_6_days
    6.times { rose.update_quality }
    assert_items([4, 14], [-4, 10], [-1, 0], [0, 80], [9, 27], [-3, 0])
  end

  def test_after_7_days
    7.times { rose.update_quality }
    assert_items([3, 13], [-5, 12], [-2, 0], [0, 80], [8, 29], [-4, 0])
  end

  def test_after_8_days
    8.times { rose.update_quality }
    assert_items([2, 12], [-6, 14], [-3, 0], [0, 80], [7, 31], [-5, 0])
  end

  def test_after_9_days
    9.times { rose.update_quality }
    assert_items([1, 11], [-7, 16], [-4, 0], [0, 80], [6, 33], [-6, 0])
  end

  def test_after_10_days
    10.times { rose.update_quality }
    assert_items([0, 10], [-8, 18], [-5, 0], [0, 80], [5, 35], [-7, 0])
  end

  def test_after_11_days
    11.times { rose.update_quality }
    assert_items([-1, 8], [-9, 20], [-6, 0], [0, 80], [4, 38], [-8, 0])
  end

  def test_after_12_days
    12.times { rose.update_quality }
    assert_items([-2, 6], [-10, 22], [-7, 0], [0, 80], [3, 41], [-9, 0])
  end

  def test_after_13_days
    13.times { rose.update_quality }
    assert_items([-3, 4], [-11, 24], [-8, 0], [0, 80], [2, 44], [-10, 0])
  end

  def test_after_14_days
    14.times { rose.update_quality }
    assert_items([-4, 2], [-12, 26], [-9, 0], [0, 80], [1, 47], [-11, 0])
  end

  def test_after_15_days
    15.times { rose.update_quality }
    assert_items([-5, 0], [-13, 28], [-10, 0], [0, 80], [0, 50], [-12, 0])
  end

  def test_after_16_days
    16.times { rose.update_quality }
    assert_items([-6, 0], [-14, 30], [-11, 0], [0, 80], [-1, 0], [-13, 0])
  end

  def test_after_17_days
    17.times { rose.update_quality }
    assert_items([-7, 0], [-15, 32], [-12, 0], [0, 80], [-2, 0], [-14, 0])
  end

  def test_after_25_days
    25.times { rose.update_quality }
    assert_items([-15, 0], [-23, 48], [-20, 0], [0, 80], [-10, 0], [-22, 0])
  end

  def test_after_26_days
    26.times { rose.update_quality }
    assert_items([-16, 0], [-24, 50], [-21, 0], [0, 80], [-11, 0], [-23, 0])
  end

  def test_after_27_days
    27.times { rose.update_quality }
    assert_items([-17, 0], [-25, 50], [-22, 0], [0, 80], [-12, 0], [-24, 0])
  end

  private

  def assert_items(*expected_items)
    expected_items.zip(items) do |(sell_in, quality), item|
      assert_equal(sell_in, item.sell_in, "#{item.name} sell_in")
      assert_equal(quality, item.quality, "#{item.name} quality")
    end
  end
end
