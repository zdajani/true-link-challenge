require 'delivery_dates'

RSpec.describe DeliveryDates do
  let(:start_date) { Date.new(2017, 9, 23) }
  let(:recurrance_num) { 1 }
  let(:dates_num) { 4 }
  let(:day) { 23 }

  describe 'next' do
    subject { DeliveryDates.new }

    it 'returns all delivery_dates' do
      expected_dates = [
        Date.new(start_date.year, 9, 22),
        Date.new(start_date.year, start_date.month + 1, 23),
        Date.new(start_date.year, start_date.month + 2, 22),
        Date.new(start_date.year, start_date.month + 3, 22)
      ]
      expect(subject.get(recurrance_num, start_date, day, dates_num)).to eq(expected_dates)
    end
  end
end
