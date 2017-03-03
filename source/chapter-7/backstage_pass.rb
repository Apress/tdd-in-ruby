require_relative 'regular_item'

class BackstagePass < RegularItem
  def update
    increase_quality_by(1)  
    if @item.sell_in < 10
      increase_quality_by(1)
    end
    if @item.sell_in < 5
      increase_quality_by(1)
    end
    if expired?
      @item.quality -= @item.quality
    end    
  end
end
