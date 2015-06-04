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