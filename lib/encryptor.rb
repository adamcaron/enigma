class Encryptor
  attr_reader :encrypted_string
  def initialize(unencrypted_string)
    @encrypted_string = unencrypted_string
  end
end