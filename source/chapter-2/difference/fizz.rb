class Fizz   
  def value(n, proc)
    if proc.call(n, 3)
      'Fizz'
    end
  end
end
