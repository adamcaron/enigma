require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_it_creates_a_generator
    keyifier = KeyGenerator.new("")
    assert "", keyifier.key
  end
  def test_it_accepts_input_of_an_existing_5_digit_key
    keyifier = KeyGenerator.new(12345)
    assert_equal 12345, keyifier.key
  end
  def test_an_existing_key_is_fixnum
    keyifier = KeyGenerator.new(12345)
    assert_equal Fixnum, keyifier.key.class
  end
  def test_an_existing_key_is_5_digits
    keyifier = KeyGenerator.new(12345)
    assert_equal 5, keyifier.key.to_s.length
  end
  def test_it_generates_a_key_when_no_key_is_provided

  end
  def test_generated_key_is_valid
    skip
  end


  # def test_it_returns_a_5_digit_number
  #   keyifier = KeyGenerator.new(12345)
  #   assert keyifier.key.to_s.length == 5
  # end
  # def test_it_generates_a_5_digit_number
  #   assert keyifier.generate.to_s.length == 5
  # end
  # def test_the_number_is_random
  # end
end