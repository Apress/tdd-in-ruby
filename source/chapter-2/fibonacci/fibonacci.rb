class Fibonacci
  def self.of(n)
    return 0 if n == 0
    return 1 if n <= 2
    
    return of(n-1) + of(n-2)
  end
end
