require_relative 'key_generator'
require_relative 'offset_calculator'
# Write a Ruby program that can just output a string like:

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 030415

# Then work to:

# Pull the specified output filename from the command line arguments and put it into the string output
# Get today's date, format it, and output it in the string
# Generate a random number as the key and output it in the string

class Encrypt
  def unencrypted_message
    File.open("message.txt", "r")
  end
  def rotate
    Rotation.new
  end
  def encrypt
    encrypted_message = File.open("encrypted_message.txt", "w")
  end
  def paths
    if __FILE__ == $0
      input_path = ARGV[0] #
      output_path = ARGV[1]
    end
  end
end