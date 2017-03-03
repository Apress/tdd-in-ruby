require 'minitest/autorun'  

module MiniTest::Assertions
  def data_driven_test(container)
    container.each do |element|
      yield element
    end
  end
end

module MiniTest::Assertions
  def assert_vowel(letter)
    assert %w(a e i o u).include?(letter), "Expected #{letter} to be a vowel"
  end
end

describe 'Vowel Checker' do
  it 'a, e, i, o, u are the vowel set' do
    data_driven_test(%w(a e i o u)) do |letter|
      assert_vowel letter
    end
  end           
end
