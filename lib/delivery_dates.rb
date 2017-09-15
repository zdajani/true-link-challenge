require 'active_support/time'
require 'calculate_date'
require 'business_day'

class DeliveryDates
  def initialize
    @calculate_date = CalculateDate.new
    @business_day = BusinessDay.new
  end

  def get(recurrance_num, start_date, day, dates_num)
    raw_dates = @calculate_date.next(recurrance_num, start_date, day, dates_num)
    dates = []
    raw_dates.each do |date|
      dates << @business_day.previous(date)
    end
    dates
  end
end
