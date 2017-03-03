require 'minitest/autorun'
require_relative 'fizz_buzz'
require_relative 'standard_console'

class TestFizzBuzz < Minitest::Test
  def test_prompt_user_for_number
    input = StringIO.new('10')
    output = StringIO.new
    console = StandardConsole.new(input, output)
    console.prompt

    assert_equal "Please enter a number from 1 to 100\n", output.string
    assert_includes (1..100).to_a, input.string.to_i 
  end

  def test_print_message
    input = StringIO.new
    output = StringIO.new
    console = StandardConsole.new(input, output)
    console.write('testing')

    assert_equal 'testing', output.string
  end


end


