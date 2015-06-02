# ENCRYPT

  ## Rotation

    Given Date: 060215

    Given Character Map:
        a - z (lowercase letters)
        0 - 9 (numbers)
        ' ' (space)
        '.' (period)
        ',' (comma)
        [New lines will not appear in the message nor character map.]

    Given randomly generated 5-digit key: 41316

    Breaking up the message 4 letters at a time:
      A B C D where "word" == "w"[A] "o"[B] "r"[C] "d"[D]

      Find the offset (find the rotation):
        Take last 4 digits of the squared-numeric-vaue of date:
          6225
        Take the key:
          41316

        For A, create a-two-digit-# based on the-first-two-digits-of-key: 41316 => '41'316 => 41
            41
              Add 41 to the-first-digit of last-4-digits-of-squared-date: 6225 => '6'225 => 6
                6
                  (41 + 6) = 47
                    A rotates by 47

        For B, create a-two-digit-# starting with the-second-digit-of-key (moving right): 41316 => 4'13'16 => 13
            13
              Add 13 to the-second-digit of last-4-digits-of-squared-date: 6225 => 6'2'25 => 2
                2
                  (13 + 2) = 15
                    B rotates by 15

        For C, create a-two-digit-# starting with the-third-digit-of-key (moving right): 41316 => 41'31'6 => 31
            31
              Add 31 to the-third-digit of last-4-digits-of-squared-date: 6225 => 62'2'5 => 2
                2
                  (31 + 2) = 33
                    C rotates by 33

        For D, create a-two-digit-# starting with the-fourth-digit-of-key (moving right): 41316 => 413'16' => 16
            16
              Add 41 to the-fourth-digit of last-4-digits-of-squared-date: 6225 => 622'5' => 5
                5
                  (16 + 5) = 21
                    D rotates by 21

            // Rotation or loop-around: (index + key) - 39 [total-characters-in-character-map]

