require_relative 'item'

class RegularItem
  def initialize(item)
    @item = item
  end
  def update
    if expired?
      decrease_quality_by(2)
    else
      decrease_quality_by(1)
    end
  end
  def expired?
    @item.sell_in < 0
  end

  def decrease_quality
    if @item.quality > 0
      @item.quality -= 1  
    end
  end

  def decrease_quality_by(factor)
    @item.quality -= factor
    enforce_quality_of_an_item_is_never_negative
  end
  
  private

  def decrease_quality_twice
    decrease_quality
    decrease_quality
  end
  
  protected

  def increase_quality_by(factor)
    @item.quality += factor
    enforce_quality_of_an_item_is_not_more_than(50)
  end

  private
  
  def enforce_quality_of_an_item_is_not_more_than(limit)
    if @item.quality > limit
      @item.quality = limit
    end
  end
  
  def enforce_quality_of_an_item_is_never_negative
    if @item.quality < 0
      @item.quality = 0
    end    
  end
  
end
