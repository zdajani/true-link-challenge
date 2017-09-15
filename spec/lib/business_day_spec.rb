require 'business_day'

RSpec.describe BusinessDay do
  let(:date) { Date.new(2017, 9, 16) }
  let(:public_holiday_date) { Date.new(2017, 12, 25) }

  describe 'previous' do
    subject { BusinessDay.new }

    it 'returns previous friday if date is on weekend' do
      expect(subject.previous(date)).to eq(Date.new(2017, 9, 15))
    end

    it 'returns previous bussiness day if date is on public holiday' do
      expect(subject.previous(public_holiday_date)).to eq(Date.new(2017, 12, 22))
    end
  end
end
