class Meetup
  def initialize(month, year)
    @month = month
    @year = year 
    @day_offset = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
  end

  def day(weekday, schedule)
    first_day = Date.new(@year, @month, @day_offset[schedule])
    (first_day..first_day + 6).detect {|day| day.public_send(weekday.to_s + '?')}
  end
end
