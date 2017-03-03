class CharacterConverter
  def initialize(n)
    @numbers = n.bytes
  end

  def to_i
    first_element = @numbers.shift
    first_number = ascii_value(first_element)

    previous_number = first_number
    until complete?   
      next_element = @numbers.shift
      next_number = ascii_value(next_element)
      previous_number = previous_number * 10 + next_number
    end
    previous_number
  end

  private

  def ascii_value(n)
    n.ord - '0'.ord
  end

  def complete?
    !(@numbers.size > 0)
  end
end