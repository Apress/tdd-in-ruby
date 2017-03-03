class Buzz  
  def value(n, proc)
    if proc.call(n, 5)
      'Buzz'
    end
  end  
end
