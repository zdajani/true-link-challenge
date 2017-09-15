require 'calculate_date'

RSpec.describe CalculateDate do
  let(:month) { Date.today.month }
  let(:year) { Date.today.year }
  let(:start_date) { Date.today }
  let(:day) { Date.today.day }

  describe 'next' do
    subject { CalculateDate.new }

    it 'calculates the next date' do
      dates_num = 1
      recurrance_num = 1
      expect(subject.next(recurrance_num, start_date, day, dates_num)).to eq(Date.new(year, month, day))
    end

    it 'calculates the next 2 dates every 2 months' do
      recurrance_num = 2
      dates_num = 2
      expected_dates = [Date.new(year, month, day), Date.new(year, month + 2, day)]
      expect(subject.next(recurrance_num, start_date, day, dates_num)).to eq(expected_dates)
    end

    it 'return the next date if start day is after current date' do
      recurrance_num = 1
      dates_num = 3
      start_day = Date.new(2017, 9, 8)
      day = 8
      expected_dates = [
        Date.new(year, month + 1, start_day.day),
        Date.new(year, month + 2, start_day.day),
        Date.new(year, month + 3, start_day.day)
      ]
      expect(subject.next(recurrance_num, start_day, day, dates_num)).to eq(expected_dates)
    end
  end
end
