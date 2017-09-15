require 'active_support/time'

class BusinessDay
  def previous(date)
    date = return_previous_day(date) if public_holiday?(date)
    weekend?(date) ? return_previous_date_before_weekend(date) : date
  end

  private

  def weekend?(date)
    date.saturday? || date.sunday?
  end

  def public_holiday?(date)
    public_holiday_list.include?(date)
  end

  def return_previous_day(date)
    date.monday? ? date.beginning_of_week(:friday) : date.prev_day
  end

  def return_previous_date_before_weekend(date)
    date = date.beginning_of_week(:friday)
    date = date.beginning_of_week(:thursday) if public_holiday?(date)
    date = date.prev_day if public_holiday?(date)
    date
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
