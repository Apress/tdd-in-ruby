class ReverseDigit
  def initialize(n)
    @n = n
  end

  def reverse
    reversed_digit = extract_rightmost_digit

    until all_digits_reversed?
      remove_rightmost_digit
      reversed_digit = reversed_digit * 10 + extract_rightmost_digit
    end
    reversed_digit
  end

  private

  def extract_rightmost_digit
    @n % 10
  end

  def remove_rightmost_digit
    @n = @n / 10
  end

  def all_digits_reversed?
    (@n / 10) == 0
  end
end