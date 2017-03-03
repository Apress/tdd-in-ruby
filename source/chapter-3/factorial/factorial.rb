class Factorial
  def self.calculate(n)
    if n < 2
      1
    else
      n * calculate(n-1)
    end
  end  
end

# Iterative Solution
# class Factorial
#   def self.calculate(n)
#     result = 1
#     2.upto(n) {|x| result *= x }
#     result
#   end
# end
