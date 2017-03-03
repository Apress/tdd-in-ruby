require_relative 'item.rb'
require_relative 'aged_brie.rb'
require_relative 'backstage_pass.rb'
require_relative 'regular_item.rb'
require_relative 'conjured_item.rb'

class GildedRose
  @items = []

  SULFURAS = "Sulfuras, Hand of Ragnaros"
  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  AGED_BRIE = "Aged Brie"
  CONJURED = "Conjured Mana Cake"
  
  ZERO_DAYS = 0
  FIVE_DAYS = 5
  TEN_DAYS = 10

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    @items.each do |item|
      next if item.name == SULFURAS
      update_number_of_days_left_to_sell(item)
      update_quality_for(item)
    end
  end
  
  def update_quality_for(item)
    clazz = if item.name == AGED_BRIE
      aged_brie = AgedBrie.new(item)
    elsif item.name == BACKSTAGE_PASSES
      backstage = BackstagePass.new(item)
    elsif item.name == CONJURED
      conjured = ConjuredItem.new(item)
    else
      regular_item = RegularItem.new(item)
    end
    clazz.update
  end
      
  def update_number_of_days_left_to_sell(item)
    item.sell_in -= 1
  end  
end