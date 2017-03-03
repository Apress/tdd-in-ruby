require_relative 'regular_item'

class AgedBrie < RegularItem
  def update
    if expired?
      increase_quality_by(2)
    else
      increase_quality_by(1)
    end
  end
end