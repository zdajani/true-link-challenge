require 'calculate_date'

RSpec.describe CalculateDate do
  let(:month) { Date.today.month }
  let(:year) { Date.today.year }
  let(:day) { 15 }

  describe 'next' do
    subject { CalculateDate.new }

    it 'calculates the next date' do
      num_occurence = 1
      expect(subject.next(num_occurence, day, 1)).to eq(Date.new(year, month, day))
    end

    it 'calculates next date two months out' do
      num_occurence = 2
      expect(subject.next(num_occurence, day, 1)).to eq(Date.new(year, month + 1, day))
    end

    it 'calculates the next 2 dates every 2 months' do
      num_occurence = 2
      num_dates = 2
      expected_dates = [Date.new(year, month + 1, day), Date.new(year, month + 3, day)]
      expect(subject.next(num_occurence, day, num_dates)).to eq(expected_dates)
    end
  end
end
