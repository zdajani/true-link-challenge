require 'active_support/time'

class BusinessDay
  def next(date)
    date = date.next_day if public_holiday?(date)
    weekend?(date) ? date.next_week(:monday) : date
  end

  def previous(date)
    date = return_previous_day(date) if public_holiday?(date)
    weekend?(date) ? date.next_week(:monday) : date
  end

  private

  def weekend?(date)
    date.saturday? || date.sunday?
  end

  def public_holiday?(date)
    [date].include?(date)
  end

  def return_previous_day(date)
    date.monday? ? date.prev_week(:friday) : date.prev_day
  end

  def public_holiday_list
    [
      Date.new(2017, 10, 9),
      Date.new(2017, 11, 23),
      Date.new(2017, 12, 25),
      Date.new(2018, 1, 1),
      Date.new(2018, 1, 15),
      Date.new(2018, 2, 19),
      Date.new(2018, 5, 28),
      Date.new(2018, 7, 4),
      Date.new(2018, 9, 3),
      Date.new(2018, 10, 8),
      Date.new(2018, 11, 12),
      Date.new(2018, 11, 22),
      Date.new(2018, 12, 25)
    ]
  end
end
