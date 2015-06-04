class OffsetCalculator
  def initialize(date=date_today)
    @date = date
  end
  def date_today
    Time.now.strftime("%d%m%y")
  end
  def squared_date
    @date.to_i**2
  end
  def offset
    squared_date.to_s.chars[-4..-1].join.to_i
  end
end

  # p date = Time.now.strftime("%d%m%y")
  # p squared_date = date.to_i**2
  # p offset = squared_date.to_s.chars[-4..-1].join.to_i


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
