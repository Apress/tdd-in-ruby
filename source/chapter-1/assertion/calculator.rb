class Calculator
  def add(x, y)
    x + y
  end
  def subtract(x, y)
    x - y
  end
end

def verify (expected, actual, message)
  if actual == expected
    puts "#{message} passed"
  else
    puts "Expected : #{expected} but got : #{actual}"
    puts "#{message} failed"
  end
end

calculator = Calculator.new
result = calculator.add(1, 2)
verify(3, result, 'Addition')
result2 = calculator.subtract(2, 1)
verify(1, result2, 'Subtraction')