require 'minitest/autorun'  

class String
  def vowel?
    %w(a e i o u).include?(self)
  end  
end

module MiniTest::Assertions
  def assert_vowel(letter)
    assert %w(a e i o u).include?(letter), "Expected #{letter} to be a vowel"
  end
end

describe 'Vowel Checker' do
  %w(a e i o u).each do |letter|
    it "#{letter} is a vowel" do
      assert_vowel letter
    end
  end
end
