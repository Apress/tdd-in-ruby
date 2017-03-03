module FixnumExtensions
  refine Fixnum do
    def fizz_buzz
      multiple_of(15) && (return 'FizzBuzz')
      multiple_of(3) && (return 'Fizz')
      multiple_of(5) && (return 'Buzz')
      self
    end

    def multiple_of(number)
      self.modulo(number).zero?
    end
  end
end
