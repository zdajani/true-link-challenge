require 'active_support/time'

class CalculateDate
  def next(recurrance_num, start_date, dates_num)
    dates_num == 1 ? first_date(start_date) : all_dates(recurrance_num, start_date, dates_num)
  end

  private

  def first_date(start_date)
    year = start_date.year
    month = date_passed?(start_date) ? start_date.month.next : start_date.month
    Date.new(year, month, start_date.day)
  end

  def date_passed?(start_date)
    Date.today > start_date
  end

  def all_dates(recurrance_num, start_date, dates_num)
    dates = [first_date(start_date)]
    (1..dates_num - 1).each do |num|
      dates << first_date(start_date).next_month(num + (recurrance_num - 1))
    end
    dates
  end
end
