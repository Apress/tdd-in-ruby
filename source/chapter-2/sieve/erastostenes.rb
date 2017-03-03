class Erastostenes 
  def initialize(limit)
    @limit = limit
    @list = (2..@limit).to_a  
  end

  def number_list
    (2..@limit).to_a  
  end

  def calculate
    list = number_list
    list.each do |x|
      unless x >= Math.sqrt(@limit)
        cross_out_multiples_of(x)
      end
    end
    @list
  end

  private

  def cross_out_multiples_of(number)
    @list.reject! do |x|
      unless x == number
       x % number == 0 
      end
    end    
  end
end