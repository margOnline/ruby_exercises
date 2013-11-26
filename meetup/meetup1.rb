class Meetup

  attr_reader :month, :year, :schedule

  def initialize(month, year)
    @month = month.to_i
    @year = year.to_i
  end

  def day(weekday, schedule)
    @schedule = schedule
    @weekday = weekday
    day = get_teenth weekday
    Date.new(@year, @month, day)
  end

  def self.days_of_week
    [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  end

  def self.weekday_number(weekday)
    days_of_week.index(weekday)
  end

  

  # def get weekday
  #   date = Time.new(year, month, 1)
  #   weekday_method = weekday + '?'
  #   until date.weekday_method
  #     date += (60 * 60 * 24)
  #   end
  #   date.day
  # end

  def get_teenth weekday
    teens = (13..19).to_a
    teens.select {|day| day == weekday}[0]
  end

  def day_of_week
    
  end


end


