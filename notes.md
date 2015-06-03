# Enigma:

  A Ruby-built tool for cracking an encryption algorithm

# Learning Goals / Areas of Focus:

 - Practice breaking a program into logical components
 - Testing components in isolation and in combination
 - Applying Enumerable techniques in a real context
 - Reading text from and writing text to files

# Base Expectation:

  Build an encryption engine for encrypting, decrypting, and cracking messages

  The encryption is based on rotation. The character map is made up of all the lowercase letters, then the numbers, then space, then period, then comma. New lines will not appear in the message nor character map.

# Encrypting a Message

  ## The Key:

    Given randomly generated, unique, 5-digit encryption key:
      41316 (for example)

  ## The Offsets:

    Given Date in the format DDMMYY:
      060215 (for example)
        Square the date's numeric form:
          3625846225
            and find the last four digits:
              6225

              Four characters of the message are encrypted at a time:
                A B C D where "word" == "w"[A] "o"[B] "r"[C] "d"[D]

              "A offset" is the-first-digit of last-4-digits-of-squared-date: 6225 => '6'225 => 6
                The-first-digit of last-4-digits-of-squared-date: ('6'225)
                  A offset = 6

              "B offset" is the-second-digit of last-4-digits-of-squared-date: 6225 => 6'2'25 => 2
                The-second-digit of last-4-digits-of-squared-date: (6'2'25)
                  B offset = 2

              "C offset" is the-third-digit of last-4-digits-of-squared-date: 6225 => 62'2'5 => 2
                The-third-digit of last-4-digits-of-squared-date: (62'2'5)
                  C offset = 2

              "D offset" is the-fourth-digit of last-4-digits-of-squared-date: 6225 => 622'5' => 5
                The-fourth-digit of last-4-digits-of-squared-date: (622'5')
                  D offset = 5

  ## Rotation

    Given Character Map:
      [New lines will not appear in the message nor character map.]
      a - z (lowercase letters)
      0 - 9 (numbers)
      ' ' (space)
      '.' (period)
      ',' (comma)
        ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ' ', '.', ',']
    Given the key:
      41316
    Given Offsets (from last-4-digits-of-squared-date: 6225):
      A offset(6)
      B offset(2)
      C offset(2)
      D offset(5)

        // first two digits of the key are the "A" rotation
        For A, create a-two-digit-# based on the-first-two-digits-of-key: 41316 => '41'316 => 41
          41
            Add 41 to the A-offset(6)
              6
              // The first character is rotated forward by the "A" rotation plus the "A offset"
                (41 + 6) = 47
                  A rotates by 47

        // second and third digits of the key are the "B" rotation
        For B, create a-two-digit-# starting with the-second-digit-of-key (moving right): 41316 => 4'13'16 => 13
          13
            Add 13 to B-offset(2)
              2
              // The second character is rotated forward by the "B" rotation plus the "B offset"
                (13 + 2) = 15
                  B rotates by 15

        // third and fourth digits of the key are the "C" rotation
        For C, create a-two-digit-# starting with the-third-digit-of-key (moving right): 41316 => 41'31'6 => 31
          31
            Add 31 to C-offset(2)
              2
              // The third character is rotated forward by the "C" rotation plus the "C offset"
                (31 + 2) = 33
                  C rotates by 33

        // fourth and fifth digits of the key are the "D" rotation
        For D, create a-two-digit-# starting with the-fourth-digit-of-key (moving right): 41316 => 413'16' => 16
          16
            Add 41 to D-offset(5)
              5
              // The fourth character is rotated forward by the "D" rotation plus the "D offset"
                (16 + 5) = 21
                  D rotates by 21





# Decrypting a Message

The offsets and keys can be calculated by the same methods above. Then each character is rotated backwards instead of forwards.



# Cracking a Key

When the key is not known, the offsets can still be calculated from the message date. We believe that each enemy message ends with the characters "..end..". Use that to determine when you've correctly guessed the key.




----------




USAGE
// The tool is used from the command line like so:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 030415
```
// Take the plaintext file message.txt
// create an encrypted file encrypted.txt.


# Decrypt
// Then, if we know the key, we can decrypt:
```
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
Created 'decrypted.txt' with the key 82648 and date 030415
```


# Cracked
// But if we don't know the key, we can try to crack it with just the date:
```
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
Created 'cracked.txt' with the cracked key 82648 and date 030415
```



----------




# The Runner

Write a Ruby program that can just output a string like:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 030415
```
Then work to:

 - Pull the specified output filename from the command line arguments and put it into the string output
 - Get today's date, format it, and output it in the string
 - Generate a random number as the key and output it in the string

# 2. Key Generator

It'd be great if instead of random numbers we could generate a legitimate key. Starting from your runner:

 - Create an instance of a key generator
 - Figure out what, if anything, you'd need to pass in to the object
 - Start writing tests for the key generator object based on the specs above
 - Go through building the implementation
 - Use it from your runner to generate and output a valid key

# 3. Offsets

Before we can start encrypting we probably need to calculate the offsets.

 - From your runner, create an instance of an offset calculator
 - Pass the current date and the generated key into the offset calculator
 - Write tests and implementation around the idea of being able to pass in the date and key, then query the A, B, C, and D final rotations

# 4. Encryption

Now that you have all the components you're ready to encrypt a message.

 - Create an encryptor object in your runner
 - What information would the encryptor need to be "setup" and ready to encrypt messages? Pass that in.
 - Call an encrypt method and pass in a string message. Get back the encrypted version.

----------





    // Rotation or loop-around: (index + key) - 39 [total-characters-in-character-map]

    // Consider .rotate as a method to offset through the array

    // rotate the original array (the distance of the offset) into a new array set up two arrays, and map the two arrays into a hash of key/value pairs.
    // do this for A rotations, B, C, and D rotations.

