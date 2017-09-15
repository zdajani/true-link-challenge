require 'active_support/time'

class CalculateDate
  def next(num_occurence, day, num_dates)
    num_dates == 1 ? first_date(num_occurence, day) : all_dates(num_occurence, day, num_dates)
  end

  private

  def first_date(num_occurence, day)
    year = Date.today.year
    month = Date.today.month
    Date.new(year, month, day).next_month(num_occurence - 1)
  end

  def all_dates(num_occurence, day, num_dates)
    dates = [first_date(num_occurence, day)]
    (1..num_dates - 1).each do |num|
      dates << first_date(num_occurence, day).next_month(num + (num_occurence - 1))
    end
    dates
  end
end
