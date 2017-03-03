require 'minitest/autorun'
require_relative 'virtual_file'

class TestVirtualFile < Minitest::Test
  def test_write_message
    file = VirtualFile.new
    file.write('testing')

    result = file.read

    assert_equal 'testing', result
  end
end
