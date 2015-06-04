# Write a Ruby program that can just output a string like:

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 030415

# Then work to:

# Pull the specified output filename from the command line arguments and put it into the string output
# Get today's date, format it, and output it in the string
# Generate a random number as the key and output it in the string

# encrypted_message = Enigma.encrypt(message, key, date)

# class Encrypt
  # reads unencrypted_message
  message = File.open("message.txt", "r")
  #
  p message.read
  # message.encrypt
  encrypted_message = File.open("encrypted_message.txt", "w")
  if __FILE__ == $0
    input_path = ARGV[0]
    output_path = ARGV[1]
  end
# end

# ## Rotation

# GET KEY FROM KEY_GENERATOR.RB
# GET OFFSET FROM OFFSET_CALCULATOR.RB
# GET MESSAGE FROM MESSAGE.RB

  #   Given Character Map:
  #     [New lines will not appear in the message nor character map.]
  #     a - z (lowercase letters)
  #     0 - 9 (numbers)
  #     ' ' (space)
  #     '.' (period)
  #     ',' (comma)
  #       ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ' ', '.', ',']
  #   Given the key:
  #     41316
  #   Given Offsets (from last-4-digits-of-squared-date: 6225):
  #     A offset(6)
  #     B offset(2)
  #     C offset(2)
  #     D offset(5)

  #       // first two digits of the key are the "A" rotation
  #       For A, create a-two-digit-# based on the-first-two-digits-of-key: 41316 => '41'316 => 41
  #         41
  #           Add 41 to the A-offset(6)
  #             6
  #             // The first character is rotated forward by the "A" rotation plus the "A offset"
  #               (41 + 6) = 47
  #                 A rotates by 47

  #       // second and third digits of the key are the "B" rotation
  #       For B, create a-two-digit-# starting with the-second-digit-of-key (moving right): 41316 => 4'13'16 => 13
  #         13
  #           Add 13 to B-offset(2)
  #             2
  #             // The second character is rotated forward by the "B" rotation plus the "B offset"
  #               (13 + 2) = 15
  #                 B rotates by 15

  #       // third and fourth digits of the key are the "C" rotation
  #       For C, create a-two-digit-# starting with the-third-digit-of-key (moving right): 41316 => 41'31'6 => 31
  #         31
  #           Add 31 to C-offset(2)
  #             2
  #             // The third character is rotated forward by the "C" rotation plus the "C offset"
  #               (31 + 2) = 33
  #                 C rotates by 33

  #       // fourth and fifth digits of the key are the "D" rotation
  #       For D, create a-two-digit-# starting with the-fourth-digit-of-key (moving right): 41316 => 413'16' => 16
  #         16
  #           Add 41 to D-offset(5)
  #             5
  #             // The fourth character is rotated forward by the "D" rotation plus the "D offset"
  #               (16 + 5) = 21
  #                 D rotates by 21