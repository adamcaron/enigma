class Rotator
  def rotate
    KeyGenerator.new.new_key
    OffsetCalculator.new.offset # gets offset
    Chunker.new.chunks # chunks into 4-char groups
    # concatenates
  end
end


  #             Four characters of the message are encrypted at a time:
  #               A B C D where "word" == "w"[A] "o"[B] "r"[C] "d"[D]

  #             "A offset" is the-first-digit of last-4-digits-of-squared-date: 6225 => '6'225 => 6
  #               The-first-digit of last-4-digits-of-squared-date: ('6'225)
  #                 A offset = 6

  #             "B offset" is the-second-digit of last-4-digits-of-squared-date: 6225 => 6'2'25 => 2
  #               The-second-digit of last-4-digits-of-squared-date: (6'2'25)
  #                 B offset = 2

  #             "C offset" is the-third-digit of last-4-digits-of-squared-date: 6225 => 62'2'5 => 2
  #               The-third-digit of last-4-digits-of-squared-date: (62'2'5)
  #                 C offset = 2

  #             "D offset" is the-fourth-digit of last-4-digits-of-squared-date: 6225 => 622'5' => 5
  #               The-fourth-digit of last-4-digits-of-squared-date: (622'5')
  #                 D offset = 5



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
