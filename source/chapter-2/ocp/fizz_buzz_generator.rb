class FizzBuzzGenerator
  def initialize(objects, list)
    @list = list
    @objects = objects
  end

  def generate
    result = []
    @list.each do |num|  
      @objects.each do |l|
        v = l.value(num) 
        unless v.nil?
          result << v
          break
        end
      end
    end
    result
  end
end
