require 'active_support/time'

class CalculateDate
  def next(recurrance_num, day, dates_num)
    dates_num == 1 ? first_date(day) : all_dates(recurrance_num, day, dates_num)
  end

  private

  def first_date(day)
    year = Date.today.year
    month = date_passed?(day) ? Date.today.month.next : Date.today.month
    Date.new(year, month, day)
  end

  def date_passed?(day)
    Date.today.day > day
  end

  def all_dates(recurrance_num, day, dates_num)
    dates = [first_date(day)]
    (1..dates_num - 1).each do |num|
      dates << first_date(day).next_month(num + (recurrance_num - 1))
    end
    dates
  end
end
