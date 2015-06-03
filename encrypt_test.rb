require 'minitest/autorun'
require 'minitest/pride'
require_relative 'encrypt'

class EncryptorTest < Minitest::Test
  def test_empty_string_does_not_get_encrypted
    encryptor = Encryptor.new("")
    # require 'pry'; binding.pry
    assert encryptor.encrypted_string == ""
  end
  def test_it_encrypts_a_character
  end
  def test_it_encrypts_two_characters
  end
  def test_it_encrypts_many_characters
  end
  def test_it_encrypts_certain_special_characters
  end
  def test_it_does_not_encrypt_other_special_characters
  end
  def test_it_puts_encrypted_string_in_file
  end
end