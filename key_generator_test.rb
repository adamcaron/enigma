require 'minitest/autorun'
require 'minitest/pride'
require_relative 'key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_generates_an_empty_string_key
    keyifier = KeyGenerator.new("")
    assert keyifier.key == ""
  end
  def test_it_generates_a_5_digit_number
  end
end