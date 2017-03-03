require 'minitest/autorun'
require_relative 'standard_console'

class TestStandardConsole < Minitest::Test
  def test_print_message
    console = StandardConsole.new

    assert_output('testing') { console.write('testing') }
  end
end
