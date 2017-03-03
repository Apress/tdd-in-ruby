class Stack
  def initialize
    @elements = []
  end

  def push(element)
    @elements << element
  end

  def pop
    if empty?
      raise 'Cannot pop an empty stack'
    end
    @elements.pop 
  end

  def size
    @elements.size
  end
  
  def top
    @elements.last
  end
  
  def empty?
    @elements.empty?
  end
  
end