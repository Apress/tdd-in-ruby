class FizzBuzz
  def random
    numbers.sample
  end
  
  private
  
  def numbers
    (1..100).to_a
  end
end